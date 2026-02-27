<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html>
<head>
    <title>Plan du site - César 2026</title>
    <meta charset="UTF-8"/>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 30px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        h1 {
            font-size: 42px;
            color: #1a1a2e;
            margin-bottom: 10px;
            font-family: 'Playfair Display', serif;
        }
        h1 span {
            color: #ffd700;
        }
        .subtitle {
            color: #666;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #ffd700;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        th {
            background: #1a1a2e;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        tr:hover {
            background: #f5f5f5;
        }
        .url {
            color: #1a1a2e;
            text-decoration: none;
            font-weight: 500;
        }
        .url:hover {
            color: #ffd700;
            text-decoration: underline;
        }
        .priority-high {
            background: #4CAF50;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }
        .priority-medium {
            background: #FFC107;
            color: #1a1a2e;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }
        .priority-low {
            background: #9E9E9E;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }
        .footer {
            margin-top: 40px;
            text-align: center;
            color: #999;
            font-size: 14px;
        }
        .footer a {
            color: #ffd700;
            text-decoration: none;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin: 30px 0;
        }
        .stat-card {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
        }
        .stat-number {
            font-size: 36px;
            font-weight: 700;
            color: #ffd700;
        }
        .stat-label {
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><span>📋</span> Plan du site - César 2026</h1>
        <div class="subtitle">
            Dernière mise à jour: <xsl:value-of select="substring(//sitemap:url[1]/sitemap:lastmod, 1, 10)"/>
        </div>
        
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(//sitemap:url)"/></div>
                <div class="stat-label">Pages totales</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(//sitemap:url[sitemap:priority > 0.8])"/></div>
                <div class="stat-label">Pages prioritaires</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(//sitemap:url[contains(sitemap:loc, 'news')])"/></div>
                <div class="stat-label">Articles</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><xsl:value-of select="count(//sitemap:url[contains(sitemap:loc, 'film')])"/></div>
                <div class="stat-label">Films</div>
            </div>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>URL</th>
                    <th>Dernière modification</th>
                    <th>Fréquence</th>
                    <th>Priorité</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//sitemap:url">
                    <xsl:sort select="sitemap:priority" order="descending"/>
                    <tr>
                        <td>
                            <a href="{sitemap:loc}" class="url" target="_blank">
                                <xsl:value-of select="substring-after(sitemap:loc, 'https://caesar2026.vercel.app/')"/>
                            </a>
                        </td>
                        <td><xsl:value-of select="sitemap:lastmod"/></td>
                        <td><xsl:value-of select="sitemap:changefreq"/></td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="sitemap:priority > 0.8">
                                    <span class="priority-high"><xsl:value-of select="sitemap:priority"/></span>
                                </xsl:when>
                                <xsl:when test="sitemap:priority > 0.5">
                                    <span class="priority-medium"><xsl:value-of select="sitemap:priority"/></span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span class="priority-low"><xsl:value-of select="sitemap:priority"/></span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
        
        <div class="footer">
            <p>© 2026 César 2026 - <a href="https://caesar2026.vercel.app/">Retour au site</a></p>
            <p style="font-size: 12px; margin-top: 10px;">Généré le <xsl:value-of select="substring(//sitemap:url[1]/sitemap:lastmod, 1, 10)"/></p>
        </div>
    </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
