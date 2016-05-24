package org.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/VAADIN/**", "/resources/**").permitAll();
		http.authorizeRequests().anyRequest().authenticated().and().formLogin().loginPage("/login")
				.successForwardUrl("/main").permitAll();
		http.csrf().disable();
		http.headers().frameOptions().sameOrigin();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		SpringCustomAuthProvider customAuthenticationProvider = new SpringCustomAuthProvider();
		auth.authenticationProvider(customAuthenticationProvider);
	}

}
