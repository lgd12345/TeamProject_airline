package com.airline.a1.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration //이것은 xml파일입니다.
public class InterceptorConfig implements WebMvcConfigurer {
//web에 관련된 설정을 하자 : WebMvcConfigurer
	
	@Autowired
	private CustomInterceptor customInterceptor;
	
	@Autowired
	private MemberInterceptor memberInterceptor;
	
	@Autowired
	private NoticeInterceptor noticeInterceptor;
	
	@Autowired
	private Notice2Interceptor notice2Interceptor;
	
	@Autowired
	private Notice2_Interceptor notice2_Interceptor;
	
	@Autowired
	private NoticeSelectInterceptor noticeSelectInterceptor;
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	//addInterceptors :  interceptor를 등록하는 메서드
	@Override
		public void addInterceptors(InterceptorRegistry registry) {
			//interceptor를 등록하기 : interceptorResistry에 등록/customInterceptor는 상속받으므로 handler어쩌구 타입이 맞다
			//registry.addInterceptor(customInterceptor) 
			//.addPathPatterns("/member/*") // /*하면 전부 //Interceptor를 사용할 URL패턴을 등록
			//.addPathPatterns("/member/memberPage") //.더하면 계속 추가가능하다.
			//.excludePathPatterns("/member/memberLogin") //Interceptor를 제외할 URL패턴을 등록
			//.excludePathPatterns("member/memberJoin");
		
		
			//registry.addInterceptor(interceptor) : 더 하려면 추가가능
			
		
		
			//로그인안되어 있으면 memberPage못가게 하기
			registry.addInterceptor(memberInterceptor)
			.addPathPatterns("/booking/*")
			.excludePathPatterns("/booking/airportDepList")
			.excludePathPatterns("/booking/bookingMain")
			.excludePathPatterns("/booking/airportCheck")
			.addPathPatterns("/bookingMain")
			.addPathPatterns("/mypage/*")
			.addPathPatterns("/notice2/notice2Write")
			.addPathPatterns("/notice2/notice2Update")
			.addPathPatterns("/notice2/notice2List")
			.addPathPatterns("/notice2/notice2Select");
			
		  //공지사항
		  registry.addInterceptor(noticeInterceptor)
		  .addPathPatterns("/notice/noticeWrite")
		  .addPathPatterns("/notice/noticeUpdate");
		  
		  //이용후기 회원이 관리자페이지로 갈때
		  registry.addInterceptor(notice2Interceptor)
		  .addPathPatterns("/notice2/notice2Select1")
		  .addPathPatterns("/notice2/notice2Write1")
		  .addPathPatterns("/notice2/notice2Update1");
		  
		  //이용후기 관리자가 회원으로 갈때 관리자페이지로 보내버림 
		  registry.addInterceptor(notice2_Interceptor)
		  .addPathPatterns("/notice2/notice2List")
		  .addPathPatterns("/notice2/notice2Select")
		  .addPathPatterns("/notice2/notice2Write")
		  .addPathPatterns("/notice2/notice2Update")
		  .addPathPatterns("/mypage/*");
		  
		 
		  //관리자만 admin페이지 접속하도록
		  registry.addInterceptor(adminInterceptor)
		  .addPathPatterns("/admin/*");
			
			//WebMvcConfigurer.super.addInterceptors(registry);
		}
	
}
