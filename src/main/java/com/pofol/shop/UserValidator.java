package com.pofol.shop;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.pofol.shop.domain.User;

public class UserValidator
    implements Validator
{

    public UserValidator()
    {
    }

    public boolean supports(Class clazz)
    {
        return User.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors)
    {
        System.out.println("UserValidator.validate() is called");
        User user = (User)target;
        String id = user.getId();
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");
        if(id == null || id.length() < 4 || id.length() > 12)
            errors.rejectValue("id", "invalidLength", new String[] {
                "4", "12"
            }, null);
    }
}
