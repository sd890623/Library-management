package com.daniel.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils 
{
	public static int dateVariance(String dateString)
	{
		try
		{
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			
			Calendar todayCal = Calendar.getInstance();
			todayCal.setTime(new Date());
			
			Calendar dateCal = Calendar.getInstance();
			dateCal.setTime(sdf.parse(dateString));
			
			return todayCal.get(Calendar.DATE) - dateCal.get(Calendar.DATE);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	public static int compareDate(String date) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("MM/dd/yyyy");
		Date mydate, current;
		
		try
			{
				mydate=dateFormatter.parse(date);
				current = dateFormatter.parse(dateFormatter.format(new Date() ));
				return mydate.compareTo(current);
			} catch (ParseException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return 0;
		
		
	}
	
	public static String getDateString(Date date)
	{
		try
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			return sdf.format(date);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "";
		}
	}
}
