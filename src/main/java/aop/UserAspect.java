package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.User;

@Component
@Aspect
public class UserAspect {
	//args(session,..) : session���� �����ϴ� �Ű������� �ִٸ� �� �޼��带 �����ض�.
	@Around("execution(* controller.User*.check*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, 
										HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LogInException("�α��� �� �ŷ��ϼ���.", "login.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	//mypage ���� �� üũ.
	@Around("execution(* controller.User*.check*(..)) && args(id,session)")
	public Object userIdCheck(ProceedingJoinPoint joinPoint, String id,
										HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LogInException("�α��� �� �ŷ��ϼ���.", "login.shop");
		}
		if(!loginUser.getUserId().equals("admin") && !loginUser.getUserId().equals(id)) {
			throw new LogInException("���� ������ ��ȸ �����մϴ�.", "main.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
