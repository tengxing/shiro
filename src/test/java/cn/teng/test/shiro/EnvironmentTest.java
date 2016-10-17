package cn.teng.test.shiro;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * 测试环境
 * 
 * @author tx
 *
 */
/*@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration(value="src/main/webapp")
@ContextHierarchy({  
    @ContextConfiguration(name = "parent", locations = "classpath:spring-config.xml"),  
    @ContextConfiguration(name = "child", locations = "classpath:springmvc-servlet.xml")  
}) */
public class EnvironmentTest {
	
	/*  @Autowired  
	    private WebApplicationContext wac;  
	    private MockMvc mockMvc;  
	  
	    @Before  
	    public void setUp() {  
	        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();  
	    }  
	    
	    @Test  
	    public void testView() throws Exception {  
	        MvcResult result = mockMvc..perform(MockMvcRequestBuilders.get("/user/1"))  
	                .andExpect(MockMvcResultMatchers.view().name("user/view"))  
	                .andExpect(MockMvcResultMatchers.model().attributeExists("user"))  
	                .andDo(MockMvcResultHandlers.print())  
	                .andReturn();  
	    	
	        System.out.println("success!");
	          
	      
	    }  
*/
	
}
