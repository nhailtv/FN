package Java;

public class User {
	private String Email;
	private String Password;
	private String PhoneNumber;
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public User(String email, String password, String phoneNumber) {
		Email = email;
		Password = password;
		PhoneNumber = phoneNumber;
	}
	public User() {

	}
	
	
}
