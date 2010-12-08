# Cahoot Freeagent

## Summary

A gem to convert Cahoot HTML statements to Freeagent compatible CSV files. 

## What is Cahoot?

Cahoot is a UK online bank. Well online in the looser sense of the word. They don't publish electronic statements in OFX or QIF format.

I use the excellent [FreeAgentCentral][1] to manage my accounts and found it was a real pain to constantly create CSV files for upload. So this gem automates the process.

## Still some analogue

You still have to download the HTML statement. You can do this by selecting the statement you want then going to the print view. This is the HTML you want. Save this file locally.

## Using the gem

The gem is a command line tool that works like this

    cahoot_freeagent yourstatement.html

This will spit out a FreeAgent Compatible CSV file.

## The future

The future is banks that offer Electronic Statement Downloads and an API. Until then you have to use crappy scripts like this to manage your finances. 

[1]: http://www.freeagentcentral.com
