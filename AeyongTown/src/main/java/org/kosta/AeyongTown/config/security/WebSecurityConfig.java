package org.kosta.AeyongTown.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
//스프링 시큐리티가 제공하는 설정 클래스가 import되고 스프링 시큐리티를 이용할 때 필요한 컴포넌트의 빈이 자동으로 정의됨
@EnableWebSecurity
//특정 주소로 접근을 하면 권한 및 인증을 미리 체크
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
				"/js/**", "/templates/**", "/upload/**", "/goods/list/**").permitAll().anyRequest().authenticated();
	
		http.formLogin().loginPage("/loginForm").loginProcessingUrl("/login").failureUrl("/login_fail")
				.defaultSuccessUrl("/home", true).usernameParameter("memberId").passwordParameter("password").and()
				.formLogin().permitAll();

		http.logout().permitAll().logoutUrl("/logout").logoutSuccessUrl("/home").invalidateHttpSession(true).and()
				.exceptionHandling().accessDeniedPage("/accessDeniendView")
				.authenticationEntryPoint(new AjaxAuthenticationEntryPoint("/loginForm"));
		
		http.sessionManagement().maximumSessions(1).maxSessionsPreventsLogin(true).expiredUrl("/login");
	}
}
