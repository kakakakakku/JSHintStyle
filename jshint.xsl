<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/jshint">
		<html>
			<head>
				<title>JSHint Violations</title>
			</head>
			<body bgcolor="#FFFFEF">
				<p><b>JSHint Violations</b></p>
			    <table border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#CC9966">
						<th colspan="2"><b>Summary</b></th>
					</tr>
					<tr bgcolor="#F3F3E1">
						<td>Target Files</td>
						<td><xsl:number level="any" value="count(descendant::file[issue])"/></td>
					</tr>
					<tr bgcolor="#CCF3D0">
						<td>Total Errors</td>
						<td><xsl:number level="any" value="count(descendant::issue)"/></td>
					</tr>
				</table>
			    <hr align="left" width="95%" size="1"/>
			    <p>The following are violations of the JSHint.</p>
			    <p/>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="file[issue]">
	    <table bgcolor="#AFFFFF" width="95%" border="1" cellspacing="0" cellpadding="2">
			<tr>
				<th> File: </th>
		   	<td>
				<xsl:value-of select="@name"/>
			</td>
			</tr>
		</table>
		<table bgcolor="#DFFFFF" width="95%" border="1" cellspacing="0" cellpadding="2">
			<tr>
			   <th>Line Number</th>
			   <th>Char Number</th>
			   <th>Reason</th>
			   <th>Evidenve</th>
			</tr>
			<xsl:apply-templates select="issue"/>
		</table>
		<p/>
	</xsl:template>

	<xsl:template match="issue">
		<tr>
			<td><xsl:value-of select="@line"/></td>
			<td><xsl:value-of select="@char"/></td>
			<td><xsl:value-of select="@reason"/></td>
			<td>
				<xsl:variable name="evidence" select="@evidence" />
				<xsl:if test="$evidence!=''">
					<xsl:value-of select="$evidence" />
				</xsl:if>
				<xsl:if test="$evidence=''">
					<xsl:text>-</xsl:text>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>