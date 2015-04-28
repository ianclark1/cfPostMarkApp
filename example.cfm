
<!--- E-mail example without attachment --->
<cftry>
<cfinvoke component="PostMarkAPI" method="sendMail" returnVariable="pmCode">
    <cfinvokeargument name="mailTo" value="them@they.com">
    <cfinvokeargument name="mailFrom" value="you@you.com">
    <cfinvokeargument name="mailSubject" value="Your Subject">
    <cfinvokeargument name="apiKey" value="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx">
    <cfinvokeargument name="mailHTML" value="<body><strong>Your Content</strong></body>">
</cfinvoke>

mail sent<br/>
<cfdump var="#pmCode#">

<!--- catch exceptions. --->
    <cfcatch type="Any">
        <cfoutput>
            <hr>
            <h1>Other Error: #cfcatch.Type#</h1>
            <ul>
                <li><b>Message:</b> #cfcatch.Message#
                <li><b>Detail:</b> #cfcatch.Detail#
                <li><b>Stack Trace:</b> #cfcatch.StackTrace#
            </ul>
        </cfoutput>
    </cfcatch>

</cftry>

<!--- E-mail example with attachment --->

<cftry>

<cfset thisPath = ExpandPath("*.*")>
<cfset thisDirectory = GetDirectoryFromPath(thisPath)>

<cfset targFile = "test.txt">
<!---
<cfset targFile1 = "test2.doc">
<cfset targFile2 = "test3.docx">
--->

<cfset tmpFile = #GetFileFromPath("#thisPath#/#targfile#")#>
<!---
<cfset tmpFile1 = #GetFileFromPath("#thisPath#/#targfile1#")#>
<cfset tmpFile2 = #GetFileFromPath("#thisPath#/#targfile2#")#>
--->

<!--- this is an example attachment struct. You can build it any way you like. A hard-coded example would be:
<cfset _attachmentStruct._attachment1 = "c:\your directories\your files\yourFile.txt">
--->
<cfset _attachmentStruct = StructNew()>
<cfset _attachmentStruct._attachment1 = "#thisDirectory##tmpFile#">

<!--- additional attachments
<cfset _attachmentStruct._attachment2 = "#thisDirectory##tmpFile1#">
<cfset _attachmentStruct._attachment3 = "#thisDirectory##tmpFile2#">
--->

<cfinvoke component="PostMarkAPI" method="sendMail" returnVariable="pmCode" argumentCollection="#_attachmentStruct#">
    <cfinvokeargument name="mailTo" value="them@they.com">
    <cfinvokeargument name="mailFrom" value="you@you.com">
    <cfinvokeargument name="mailSubject" value="Your Subject">
    <cfinvokeargument name="apiKey" value="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx">
    <cfinvokeargument name="mailHTML" value="<body><strong>Your Content with attachment(s).</strong></body>">
</cfinvoke>

mail sent<br/>

<br/>
<cfdump var="#pmCode#">

<!--- catch exceptions. --->
    <cfcatch type="Any">
        <cfoutput>
            <hr>
            <h1>Other Error: #cfcatch.Type#</h1>
            <ul>
                <li><b>Message:</b> #cfcatch.Message#
                <li><b>Detail:</b> #cfcatch.Detail#
                <li><b>Stack Trace:</b> #cfcatch.StackTrace#
            </ul>
        </cfoutput>
    </cfcatch>

</cftry>



