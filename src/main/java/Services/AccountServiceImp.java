package Services;


import DAO.AccountDaoImp;
import DAO.IAccountDao;
import Models.Account;
import Models.User;

@SuppressWarnings("serial")
public class AccountServiceImp implements IAccountService{

	IAccountDao accountDao = new AccountDaoImp();
	
	@Override
	public Account findByUsername(String username) {
		
		return accountDao.findByUsername(username);
	}

	@Override
	public Account Login(String username, String password, String role) {
		Account account = this.findByUsername(username);
		if (account != null && password.equals(account.getPassword()) && role.equals(account.getRole())) {
			return account;
		} else {
			return null;
		}
	}

	@Override
	public boolean register(String email, String username, String password, String role, String token) {
		if (accountDao.checkExistUsername(username)) {
			return false;
		} else {
		accountDao.insert(new Account(username, password, email, role, token));
		return true;
		}
	}

	@Override
	public boolean checkExistUsername(String username) {
		return accountDao.checkExistUsername(username);
	}

	@Override
	public boolean activateAccount(String token) {
		
		return accountDao.activateByToken(token);
	}

	@Override
	public User getUserByUsername(String username) {
		return accountDao.getUserByUsername(username);
	}

}
