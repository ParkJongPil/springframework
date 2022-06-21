package com.spring.javagreenS;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.javagreenS.service.MemberService;
import com.spring.javagreenS.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 회원 로그인
	@RequestMapping(value = "/memLogin", method = RequestMethod.GET)
	public String memLoginGet(HttpServletRequest request) {
		// 로그인폼 호출시 기존에 저장된 쿠키가 있다면 불러와서 mid에 담아서 넘겨준다.
		Cookie[] cookies = request.getCookies();
		String mid = "";
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
				break;
			}
		}
		
		return "member/memLogin";
	}
	// 로그인 인증처리
	@RequestMapping(value = "/memLogin", method = RequestMethod.POST)
	public String memLoginPost(Model model,
			RedirectAttributes redirect, //model과 충돌되어 한가지만 써야된다.
			HttpServletRequest request, HttpServletResponse response,
			String mid,
			String pwd,
			@RequestParam(name="idCheck", defaultValue = "", required = false) String idCheck,
			HttpSession session) {
		
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
			// 회원 인증처리된경우에 수행할 내용들을 기술한다.(session에 저장할자료 처리, 쿠키값처리...)
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "운영자";
			else if(vo.getLevel() == 2) strLevel = "우수회원";
			else if(vo.getLevel() == 3) strLevel = "정회원";
			else if(vo.getLevel() == 4) strLevel = "준회원";
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", strLevel);
			//session.setAttribute("sLastDate", vo.getLastDate());
			
			if(idCheck.equals("on")) {
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60*60*24*7);		// 쿠키의 만료시간을 7일로 정함(단위:초)
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);		// 기존에 저장된 현재 mid값을 삭제한다.
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			
			// 방문횟수(오늘방문횟수) 누적하기(최종 접속일 처리) - service객체에서 처리하자....
			memberService.setMemberVisitProcess(vo);
			
			model.addAttribute("mid", mid);
			//redirect.addAttribute("mid",mid);
			return "redirect:/msg/memLoginOk";
		}
		else {
			return "redirect:/msg/memLoginNo";
		}
	}
	
	@RequestMapping(value = "/memLogout", method = RequestMethod.GET)
	public String memLogout(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		session.invalidate();
		
		model.addAttribute("mid", mid);
		return "redirect:/msg/memLogout";
	}
	
	
	// 회원가입
	@RequestMapping(value = "/memJoin", method = RequestMethod.GET)
	public String memJoinGet() {
		return "member/memJoin";
	}
	
	// 회원가입처리하기
	@RequestMapping(value = "/memJoin", method = RequestMethod.POST)
	public String memJoinPost(MultipartFile fName, MemberVO vo) {
		// 아이디 체크
		if(memberService.getMemIdCheck(vo.getMid()) != null) {
			return "redirect:/msg/memIdCheckNo";
		}
		// 닉네임 체크
		if(memberService.getNickNameCheck(vo.getNickName()) != null) {
			return "redirect:/msg/memNickCheckNo";
		}
		
		// 비밀번호 암호화 처리
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		// 체크 완료된 자료를 다시 vo에 담았다면 DB에 저장시켜준다.(회원 가입처리)
		int res = memberService.setMemInputOk(fName, vo);
		
		if(res == 1) return "redirect:/msg/memInputOk";
		else return "redirect:/msg/memInputNo";
	}
	
	// 회원 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
	public String memIdCheckGet(String mid) {
		String res = "0";
		MemberVO vo = memberService.getMemIdCheck(mid);
		if(vo != null) res = "1";
		
		return res;
	}
	
	// 회원 닉네임 체크
	@ResponseBody
	@RequestMapping(value = "/nickNameCheck", method = RequestMethod.POST)
	public String nickNameCheckGet(String nickName) {
		String res = "0";
		MemberVO vo = memberService.getNickNameCheck(nickName);
		if(vo != null) res = "1";
		
		return res;
	}
	
	// 로그인 성공시에 memberMain.jsp로 이동하기
	@RequestMapping(value = "/memMain", method = RequestMethod.GET)
	public String memMain(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		model.addAttribute("vo", vo);
		
		return "member/memMain";
	}
}
