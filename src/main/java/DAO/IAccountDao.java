package DAO;

import java.io.Serializable;

import Models.Account;
import Models.User;

public interface IAccountDao extends Serializable{

	public Account findByUsername(String username);
	void insert(Account account);
	boolean checkExistUsername(String username);
	boolean activateByToken(String token);
	User getUserByUsername(String username);
}
