package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Company;
import logic.PageService;
import logic.SettingArray;
import logic.User;
import security.CipherUtil;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private PageService service;

	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		model.addAttribute(new Company());
		return null;
	}

	@PostMapping("userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			mav.addObject("user", user);
			mav.setViewName("../user/userEntry.shop");
			return mav;
		}
		try {
			if (service.userSelect(user.getId()) != null) {
				mav.addObject("msg", "�̹� �����ϴ� ���̵��Դϴ�.");
				mav.addObject("url", "../user/userEntry.shop");
				mav.setViewName("alert");
				return mav;
			} else {
				service.userCreate(user);
				mav.setViewName("user/login");
				mav.addObject("user", user);
				mav.addObject("company", new Company());
			}
		} catch (Exception e) {
			e.printStackTrace();
			bindResult.reject("error.duplicate.user");
		}
		return mav;
	}

	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (bindResult.hasErrors()) {
			bindResult.reject("error.input.user");
//	         mav.getModel().putAll(bindResult.getModel());
			return mav;
		}

		User dbUser = service.userSelect(user.getId());

		if (dbUser == null) {
			bindResult.reject("error.login.id");
			return mav;
		}
		String password = CipherUtil.decrypt(user.getPass());
		if (password.equals(dbUser.getPass())) {
			session.setAttribute("loginUser", dbUser);
			mav.setViewName("redirect:main.shop");
		} else {
			bindResult.reject("error.login.password");
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		return mav;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.shop";
	}
	
	@RequestMapping("settingForm")
	public ModelAndView settingForm(HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		File file = new File("C:/doIT/doIT/src/main/webapp/WEB-INF/view/user/setting.txt");
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		String line = "";
		String[] str;
		String[] fstr;
		while ((line = br.readLine()) != null) {
			str = line.split(":");
			fstr = str[1].split(",");
			mav.addObject(str[0], fstr);
		}
		return mav;
	}

	@RequestMapping(value = { "userInfo", "editUser" })
	public ModelAndView userInfo(String id) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(id);
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("passChgForm")
	public ModelAndView passChgForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("loginUser");
		User user = service.userSelect(loginUser.getId());
		user.setPass(CipherUtil.decrypt(user.getPass()));
		mav.addObject("user", user);
		return mav;
	}

	@PostMapping("userUpdate")
	public ModelAndView userUpdate(User user, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/userInfo");
		service.userUpdate(user, request);
		return mav;
	}
	
	@PostMapping("setting")
	public ModelAndView setting(SettingArray setting, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/userMyPage"); //���� ���� ������ ���� ��� ������������ �ϴ� ����.
		
//		User loginUser = (User)session.getAttribute("loginUser");
//		service.userSetting(loginUser.getUserno(), setting);
		return mav;
	}
	
//	@PostMapping("update")
//	   public ModelAndView update(@Valid User user, BindingResult bindResult, HttpSession session) {
//	      ModelAndView mav = new ModelAndView();
//	      if(bindResult.hasErrors()) {
//	         bindResult.reject("error.input.user");
//	         mav.getModel().putAll(bindResult.getModel());
//	         return mav;
//	      }
//	      User loginUser = (User)session.getAttribute("loginUser");
//	      User dbUser = service.userSelect(user.getId());
//	      String password = service.messageDigest(user.getPass());
//	      if(!dbUser.getPass().equals(password)) {
//	         bindResult.reject("error.login.password");
//	         return mav;
//	      }
//	      try {
//	    	 user.setPass(password);
//	         service.userUpdate(user);
//	         mav.setViewName("redirect:mypage.shop?id="+user.getId());
//	         if(!loginUser.getId().equals("admin"))
//	        	password = service.messageDigest(user.getPass());
//	         	user.setPass(password);
//	            session.setAttribute("loginUser", user);
//	      } catch(Exception e) {
//	         e.printStackTrace();
//	         bindResult.reject("error.user.update");
//	      }
//	      return mav;
//	   }
//	
//	@PostMapping("delete")
//	   public ModelAndView delete(User user,HttpSession session) {
//	      ModelAndView mav = new ModelAndView();
//	      User loginUser = (User) session.getAttribute("loginUser");
//	      String password = service.messageDigest(user.getPass());
//	      if(!loginUser.getPass().equals(password)) {
//	         throw new LoginException("��й�ȣ�� ��ġ���� �ʽ��ϴ�.","delete.shop?id="+ user.getId());
//	      }
//	      
//	      try {
//	         service.userdelete(user);
//	         if(loginUser.getId().equals("admin")) {
//	            mav.setViewName("redirect:../admin/list.shop?id="+loginUser.getId());
//	         } else {
//	            session.invalidate();
//	            mav.addObject("msg","Ż�� �Ǿ����ϴ�. �ȳ��� ������.");
//	            mav.addObject("url","login.shop");
//	            mav.setViewName("alert");
//	         }
//	      } catch(Exception e) {
//	         e.printStackTrace();
//	         throw new LoginException("ȸ��Ż�� �� �� �����ϴ�.","delete.shop?id="+ loginUser.getId());
//	      }
//	      return mav;
//	   }
//
//	@PostMapping("companyEntry")
//	public ModelAndView userEntry(@Valid Company company,BindingResult bindResult) {
//		ModelAndView mav = new ModelAndView();
//		if(bindResult.hasErrors()) {
//			mav.getModel().putAll(bindResult.getModel());
//			mav.addObject("company",company);
//			mav.setViewName("../user/userEntry.shop");
//			return mav;
//		}
//		
//		try {
//			
//			service.companyCreate(company);
//			mav.setViewName("user/login");
//			mav.addObject("company",company);
//			mav.addObject("user",new User());
//		
//		}catch(DataIntegrityViolationException e) {
//			e.printStackTrace();
//			bindResult.reject("error.duplicate.user");
//		}
//		return mav;
//	}
	@PostMapping("passChg")
	public ModelAndView passChg(User user) {
		ModelAndView mav = new ModelAndView("user/userMyPage");
		service.passUpdate(user);
		return mav;
	}
}
