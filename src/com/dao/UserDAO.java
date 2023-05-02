package com.dao;
import com.entity.*;

import java.util.*;
/**
 * @author Administrator
 */
public interface UserDAO {
   User findById(int id);
   List<User> selectOne(User user);
   List<User> selectByUsertype(String userType);
   void update(User user);
   void updatepwd(int id,String userpassword);
   List<User> selectAll(HashMap map);
   void add(User user);
   List<User> usernamecheck(String username);
   List<User> searchUser(String key);
   void userEdit(User user);
   void deleteUser(int id);
}
