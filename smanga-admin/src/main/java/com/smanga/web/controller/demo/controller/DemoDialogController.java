package com.smanga.web.controller.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Modal window
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/demo/modal")
public class DemoDialogController
{
    private String prefix = "demo/modal";

    /**
     * Modal window
     */
    @GetMapping("/dialog")
    public String dialog()
    {
        return prefix + "/dialog";
    }

    /**
     * Elastic component
     */
    @GetMapping("/layer")
    public String layer()
    {
        return prefix + "/layer";
    }

    /**
     * Form
     */
    @GetMapping("/form")
    public String form()
    {
        return prefix + "/form";
    }

    /**
     * Form
     */
    @GetMapping("/table")
    public String table()
    {
        return prefix + "/table";
    }

    /**
     * Form check
     */
    @GetMapping("/check")
    public String check()
    {
        return prefix + "/table/check";
    }

    /**
     * Form radio
     */
    @GetMapping("/radio")
    public String radio()
    {
        return prefix + "/table/radio";
    }

    /**
     * Form returns to parent form
     */
    @GetMapping("/parent")
    public String parent()
    {
        return prefix + "/table/parent";
    }
}
