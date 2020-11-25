package com.smanga;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * Starting program
 * 
 * @author Trong Hieu
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class SmartMangaBusinessApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(SmartMangaBusinessApplication.class, args);
		System.out.println("(♥◠‿◠)ﾉﾞ The startup is successful ლ(´ڡ`ლ)  \n"
				+ "  .d8888b.  888b     d888        d8888 8888888b. 88888888888      888b     d888        d8888 888b    888  .d8888b.         d8888 \n"
				+ " d88P  Y88b 8888b   d8888       d88888 888   Y88b    888          8888b   d8888       d88888 8888b   888 d88P  Y88b       d88888 \n"
				+ " Y88b.      88888b.d88888      d88P888 888    888    888          88888b.d88888      d88P888 88888b  888 888    888      d88P888 \n"
				+ "  'Y888b.   888Y88888P888     d88P 888 888   d88P    888          888Y88888P888     d88P 888 888Y88b 888 888            d88P 888 \n"
				+ "     'Y88b. 888 Y888P 888    d88P  888 8888888P'     888          888 Y888P 888    d88P  888 888 Y88b888 888  88888    d88P  888 \n"
				+ "       '888 888  Y8P  888   d88P   888 888 T88b      888          888  Y8P  888   d88P   888 888  Y88888 888    888   d88P   888 \n"
				+ " Y88b  d88P 888   '   888  d8888888888 888  T88b     888          888   '   888  d8888888888 888   Y8888 Y88b  d88P  d8888888888 \n"
				+ "  'Y8888P'  888       888 d88P     888 888   T88b    888          888       888 d88P     888 888    Y888  'Y8888P88 d88P     888 \n");
    }
}