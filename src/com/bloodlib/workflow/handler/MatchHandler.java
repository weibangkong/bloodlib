package com.bloodlib.workflow.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bloodlib.framework.mapper.BloodTypeMapper;
import com.bloodlib.framework.mapper.FsyhMapper;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.model.Fsyh;
import com.bloodlib.framework.model.User;
import com.bloodlib.workflow.mapper.VInputUserFsyhBloodtypeMapper;
import com.bloodlib.workflow.model.VInputUserFsyhBloodtype;

public class MatchHandler {
	
	
	@Autowired
	private VInputUserFsyhBloodtypeMapper v_inputMapper;
	@Autowired
	private BloodTypeMapper bloodTypeMapper;
	@Autowired
	private FsyhMapper fsyhmapper;
	
	
	private User user;
	private BloodType bloodtype;
	private List<Long> btid_list;
	private Fsyh fsyh;
	private List<User> user_list;
	private VInputUserFsyhBloodtype v_input;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public BloodType getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(BloodType bloodtype) {
		this.bloodtype = bloodtype;
	}
	public Fsyh getFsyh() {
		return fsyh;
	}
	public void setFsyh(Fsyh fsyh) {
		this.fsyh = fsyh;
	}
	public List<User> getUser_list() {
		return user_list;
	}
	public void setUser_list(List<User> user_list) {
		this.user_list = user_list;
	}
	
	
	public MatchHandler() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MatchHandler(User user) {
		
		this.user = user;
		this.v_input=v_inputMapper.getAcceptInfo(this.user.getUserId());
		this.btid_list=this.getBTIdList();
		this.user_list=this.getUserList();
		this.bloodtype=this.getBTinfo();
		this.fsyh=fsyhmapper.getFsyhInfoByUserId(this.user.getUserId());
	}
	
	private List<Long> getBTIdList(){
		//获取到inputType
		List<Long> btid_list1=new ArrayList<Long>();
		String str_inputtype=this.v_input.getInputType();
		String[]  bttypes=str_inputtype.split(",");
		
		for (int i = 0; i < bttypes.length; i++) {
			List<BloodType> btlist=bloodTypeMapper.getBTByType1(bttypes[i]);
			for (BloodType bloodType : btlist) {
				btid_list1.add(bloodType.getBloodTypeId());
			}
			//查找type1为XX的血型id
		}
		return btid_list1;
	}
	
	//获取到匹配用户集合
	private List<User> getUserList(){
		List<User> fina_user_list=new ArrayList<User>();
		for (Long bloodtypeId : this.btid_list) {
			List<User> user_list1=v_inputMapper.getMatchUserList(bloodtypeId);
			for (User user : user_list1) {
				fina_user_list.add(user);
			}
		}
		return fina_user_list;
	}
	
	//获取用户血型信息
	private BloodType getBTinfo(){
		return bloodTypeMapper.selectByPrimaryKey(this.v_input.getBloodTypeId());
	}
}
