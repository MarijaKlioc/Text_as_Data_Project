<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->
    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:body">
        <div class="row">
        <div class="col-3"><br/><br/><br/><br/><br/>
            <xsl:for-each select="//tei:add[@place = 'marginleft']">
                <xsl:choose>
                    <xsl:when test="parent::tei:del">
                        <del>
                            <xsl:attribute name="class">
                                <xsl:value-of select="attribute::hand" />
                            </xsl:attribute>
                            <xsl:value-of select="."/></del><br/>
                    </xsl:when>
                    <xsl:otherwise>
                        <span >
                            <xsl:attribute name="class">
                                <xsl:value-of select="attribute::hand" />
                            </xsl:attribute>
                        <xsl:value-of select="."/><br/>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each> 
        </div>
        <div class="col-9">
            <div class="transcription">
                <xsl:apply-templates select="//tei:div"/>
            </div>
        </div>
        </div> 
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div class="#MWS"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:add[@place = 'marginleft']">
        <span class="marginAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <del>
            <xsl:attribute name="class">
                <xsl:value-of select="@hand"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
   
    <xsl:template match="tei:add[@place = 'supralinear']">
        <span style="vertical-align: super;">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@hand, ' supraAdd')"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:add[@place = 'intralinear']">
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@hand, ' intraAdd')"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>  
    
    <xsl:template match="tei:add[@place = 'overwritten']">
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@hand, ' overAdd')"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>  
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='sup']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='u']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
    <xsl:template match="tei:add[@type='overwritten']">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    
    <xsl:template match="tei:unclear">
        <span class="unclear">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
       
    <xsl:template match="tei:metamark[@function='below']">
        <span class="below-mark">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:metamark[@function='above']">
        <span class="above-mark">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:metamark[@function='pagenumber']">
        <span class="page-number">
            <hi rend="circled">
                <xsl:apply-templates/>
            </hi>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:p[contains(@style, 'text-indent: -5px;')]">
        <span style="display: block; text-indent: -5px;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:p[contains(@style, 'text-indent: 20px;')]">
        <span style="display: block; text-indent: 20px;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
   
</xsl:stylesheet>
