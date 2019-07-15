package logic;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

public class Cart {
	private List<ItemSet> itemSetList = new ArrayList<ItemSet>();
	
	public List<ItemSet> getItemSetList(){
		return itemSetList;
	}
	public long getTotal() {
		long sum = 0;
		for(ItemSet is : itemSetList) {
			sum += is.getQuantity() * is.getItem().getPrice();
			return sum;
		}
		return 0;
	}
	
	public void push(ItemSet itemSet) {
		//itemSetList : ��ٱ��� ���
		//itemSet : �����ڰ� ��ٱ��Ͽ� �߰��� ��ǰ
		for(ItemSet is : itemSetList) {
			//���� �̹� ��ٱ��Ͽ� �ִ� ��ǰ�̶�� ������ �������� �ش�.
			if(is.getItem().getId() == itemSet.getItem().getId()) {
				is.setQuantity(is.getQuantity() + itemSet.getQuantity());
				return;
			}
		}
		itemSetList.add(itemSet);
	}
	public boolean isEmpty() {
		return itemSetList == null || itemSetList.size() == 0;
	}
	public void clearAll(HttpSession session) {
		itemSetList.clear();
		session.setAttribute("CART", this);//������ clear �����Ƿ� ������ ��������.
	}
	
}
