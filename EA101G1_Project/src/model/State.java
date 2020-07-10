package idv.david.websocketchat.model;

import java.util.Set;

public class State {
	private String type;
	// the user changing the state
	private String user;
	// total users
	private Set<String> users;
	//friend user
	private Set<String> friends;
	//isonline
	private Boolean isonline;
	

	public State(String type, String user, Set<String> users ,Set<String> friends,Boolean isonline) {
		super();
		this.type = type;
		this.user = user;
		this.users = users;
		this.friends = friends;
		this.isonline=isonline;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public Set<String> getUsers() {
		return users;
	}


	public void setUsers(Set<String> users) {
		this.users = users;
	}


	public Set<String> getFriends() {
		return friends;
	}


	public void setFriends(Set<String> friends) {
		this.friends = friends;
	}


	public boolean isIsonline() {
		return isonline;
	}


	public void setIsonline(boolean isonline) {
		this.isonline = isonline;
	}


	

	

}
