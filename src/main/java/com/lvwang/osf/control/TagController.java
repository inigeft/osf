package com.lvwang.osf.control;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lvwang.osf.model.Event;
import com.lvwang.osf.model.User;
import com.lvwang.osf.service.FeedService;
import com.lvwang.osf.service.InterestService;
import com.lvwang.osf.service.TagService;
import com.lvwang.osf.util.Property;

@Controller
@RequestMapping("/tag")
public class TagController {

	@Autowired
	@Qualifier("tagService")
	private TagService tagService;
	
	@Autowired
	@Qualifier("interestService")
	private InterestService interestService;
	
	
	@RequestMapping("/{tag}")
	public ModelAndView getFeedsWithTag(@PathVariable("tag") String tag, HttpSession session) {
		try {
			tag = new String(tag.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tag/index");
		
		mav.addObject("tag", tag);
		
		User user = (User)session.getAttribute("user");
		if(user != null) {
			mav.addObject("isInterest", 
						  interestService.hasInterestInTag(user.getId(), tagService.getID(tag)));
			
		} else {
			mav.addObject("isInterest", false);
		}
		
		List<Event> feeds = tagService.getWithTag(tag);
		mav.addObject("feeds", feeds);
		mav.addObject("imgBaseUrl", "http://osfimgs.oss-cn-hangzhou.aliyuncs.com/");
		return mav;
	}
	/**
	 * 对某个标签感兴趣
	 */
	@ResponseBody
	@RequestMapping("/{tag_id}/interest")
	public Map<String, Object> interest(@PathVariable("tag_id") int tag_id, HttpSession session) {
		Map<String, Object> ret = new HashMap<String, Object>();
		
		User user = (User) session.getAttribute("user");
		interestService.interestInTag(user.getId(), tag_id);
				
		ret.put("satus", Property.SUCCESS_INTEREST);
		return ret;
	}
	
	
	/**
	 * 
	 */
	@ResponseBody
	@RequestMapping("/{tag_id}/undointerest")
	public Map<String, Object> undoInterest(@PathVariable("tag_id") int tag_id, HttpSession session) {
		Map<String, Object> ret = new HashMap<String, Object>();
		
		User user = (User) session.getAttribute("user");
		interestService.undoInterestInTag(user.getId(), tag_id);
		
		ret.put("satus", Property.SUCCESS_INTEREST_UNDO);
		return ret;
	}
	
	
	
	
}