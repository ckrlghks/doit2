package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.CartEmptyException;
import exception.LogInException;
import logic.Cart;

@Component//CartAspect�� dispatcherController�� ������ �� ��üȭ��Ų��.
@Aspect
public class CartAspect {
	//execution(* controller.Cart*.check*(..)) : pointcut �ٽɱ��
	//���������� �������, ��Ʈ�ѷ� ��Ű�� ���� cart~ Ŭ������ check~�޼���, �Ķ���� ��� ����.
	@Around("execution(* controller.Cart*.check*(..))")
	public Object cartCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		//joinpoint�� ù��° �ƱԸ�Ʈ���� �ش� ������ ������ ����ִ�.
		HttpSession session = (HttpSession)joinPoint.getArgs()[0];
		Cart cart = (Cart) session.getAttribute("CART");
		if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException
				("��ٱ��Ͽ� �ֹ� ��ǰ�� �����ϴ�.", "../item/list.shop");
		}else if(session.getAttribute("loginUser") == null) {
			throw new LogInException
				("�α��� �� ���� ��ǰ �ֹ��� �����մϴ�." , "../item/list.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
}
