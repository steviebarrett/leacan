<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">

  <xsl:import href="references.xsl"/>

  <xsl:output encoding="UTF-8" method="html"/>

  <xsl:param name="uri"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="/module">
    <a href="{$uri}" style="float: right; text-decoration: none; font-size: normal">[normal]</a>
    <h1>
      <xsl:apply-templates select="h/child::node()"/>
    </h1>
    <xsl:apply-templates select="p | module | section"/>
  </xsl:template>


  <xsl:template match="module/module | section/module | section">
    <section>
      <hr/>
      <h4>
        <xsl:if test="name(.)='section'">
          <xsl:attribute name="class">
            <xsl:text>text-muted text-uppercase</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:apply-templates select="h/child::node()"/>
      </h4>
      <section>
        <!--
        <xsl:apply-templates
          select="p[not(preceding-sibling::module or preceding-sibling::section)]"/>
        <section class="ms-5">
          <xsl:apply-templates
            select="p[preceding-sibling::module or preceding-sibling::section] | module | section"/>
        </section>
        -->
        <section class="ms-5">
          <xsl:apply-templates select="p | module | section"/>
        </section>
      </section>
    </section>
  </xsl:template>

  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- lists -->

  <xsl:template match="ol">
    <ol>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>

  <xsl:template match="ul">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="xl">
    <ol>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>

  <xsl:template match="li">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>



<!-- text content -->

  <xsl:template match="a">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>

  <xsl:template match="ax">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>

  <xsl:template match="m">
    <mark style="padding: 0.08em;">
      <xsl:apply-templates/>
    </mark>
  </xsl:template>

  <xsl:template match="g">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>
  
  <xsl:template match="emph">
    <em>
      <xsl:apply-templates/>
    </em>
  </xsl:template>

  <xsl:template match="en">
    <span class="text-muted en">
      <xsl:text>‘</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>’</xsl:text>
    </span>
  </xsl:template>

  <xsl:template match="bad">
    <span style="color: green">*</span>
    <span
      style="font-style: italic; text-decoration-line: underline; text-decoration-style: wavy; text-decoration-color: green;"
      title="gonny no!">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="note">
    <small class="text-muted">
      <xsl:apply-templates/>
    </small>
  </xsl:template>

  <xsl:template match="ed">
    <span class="small text-danger">
      <xsl:text>[Ed. – </xsl:text>
      <xsl:apply-templates/>
      <xsl:text>]</xsl:text>
    </span>
  </xsl:template>

  <xsl:template match="masc">
    <em>masc.</em>
  </xsl:template>
  
  <xsl:template match="fem">
    <em>fem.</em>
  </xsl:template>
  
  <xsl:template match="adj">
    <em>adj.</em>
  </xsl:template>
  
  <xsl:template match="vb">
    <em>vb.</em>
  </xsl:template>
  
  <xsl:template match="etc">
    <em>&amp;c</em>
  </xsl:template>
  
  <xsl:template match="eg">
    <em>eg.</em>
  </xsl:template>

  <xsl:template match="slen">
    <em>slend.</em>
  </xsl:template>



 

  <!-- corpus examples -->

  <xsl:template match="gd">
    <small>
      <xsl:apply-templates/>
    </small>
  </xsl:template>

  <xsl:template match="tr">
    <br/>
    <small class="text-muted">
      <xsl:apply-templates/>
    </small>
  </xsl:template>

  <xsl:template match="ref">
    <br/>
    <small  class="text-muted">
      <xsl:text>📚</xsl:text>
      <xsl:call-template name="biblio"/>
      <xsl:apply-templates/>
    </small>
  </xsl:template>


  <xsl:template match="xl/li/note">
    <br/>
    <small class="text-muted">
      <xsl:text>nb. </xsl:text>
      <xsl:apply-templates/>
    </small>
  </xsl:template>

  
</xsl:stylesheet>
