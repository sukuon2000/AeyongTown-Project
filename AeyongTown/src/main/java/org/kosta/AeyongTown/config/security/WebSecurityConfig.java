package org.kosta.AeyongTown.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers("/", "/home", "/loginForm", "/user/**", "/css/**", "/fonts/**", "/img/**",
				"/js/**", "/upload/**").permitAll().anyRequest().authenticated();
		
		http.formLogin().loginPage("/loginForm").loginProcessingUrl("/login").failureUrl("/login_fail")
				.defaultSuccessUrl("/home", true).usernameParameter("memberId").passwordParameter("password").and()
				.formLogin().permitAll();
		
		http.logout().permitAll().logoutUrl("/logout").logoutSuccessUrl("/home").invalidateHttpSession(true).and()
				.exceptionHandling().accessDeniedPage("/accessDeniendView")
				.authenticationEntryPoint(new AjaxAuthenticationEntryPoint("/loginForm"));
		
		http.sessionManagement().maximumSessions(1).maxSessionsPreventsLogin(true).expiredUrl("/login");
	}
}
