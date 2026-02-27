<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html>
<head>
    <title>Sitemap - César 2026</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f5f7fa; }
        h1 { color: #1a1a2e; font-family: 'Playfair Display', serif; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        th { background: #1a1a2e; color: white; padding: 12px; text-align: left; }
        td { padding: 10px; border-bottom: 1px solid #eee; }
        tr:hover { background: #f5f5f5; }
        .url { color: #0066cc; text-decoration: none; }
        .url:hover { text-decoration: underline; }
        .priority-high { color: #4CAF50; font-weight: bold; }
        .priority-medium { color: #FFC107; }
        .priority-low { color: #9E9E9E; }
    </style>
</head>
<body>
    <h1>📋 Plan du site - César 2026</h1>
    <p>Dernière mise à jour: 28 février 2026</p>
    <table>
        <tr>
            <th>URL</th>
            <th>Dernière modification</th>
            <th>Fréquence</th>
            <th>Priorité</th>
        </tr>
        <xsl:for-each select="urlset/url">
            <tr>
                <td><a href="{loc}" class="url" target="_blank"><xsl:value-of select="substring-after(loc, 'https://caesar2026.vercel.app/')"/></a></td>
                <td><xsl:value-of select="lastmod"/></td>
                <td><xsl:value-of select="changefreq"/></td>
                <td>
                    <xsl:choose>
                        <xsl:when test="priority > 0.8"><span class="priority-high"><xsl:value-of select="priority"/></span></xsl:when>
                        <xsl:when test="priority > 0.5"><span class="priority-medium"><xsl:value-of select="priority"/></span></xsl:when>
                        <xsl:otherwise><span class="priority-low"><xsl:value-of select="priority"/></span></xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </xsl:for-each>
    </table>
    <p style="margin-top: 20px; color: #666;">© 2026 César 2026 - <a href="https://caesar2026.vercel.app/">Retour au site</a></p>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
