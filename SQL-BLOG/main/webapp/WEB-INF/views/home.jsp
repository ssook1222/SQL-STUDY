<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<title>2023-SQL</title>

<style>
/* cspell:disable-file */
/* webkit printing magic: print all background colors */
html {
	-webkit-print-color-adjust: exact;
}
* {
	box-sizing: border-box;
	-webkit-print-color-adjust: exact;
	font-family: 'IBM Plex Sans KR', sans-serif;
}

html,
body {
	margin: 0;
	padding: 0;
	width:100%
}
@media only screen {
	body {
		margin: 2em auto;
		max-width: 900px;
	}
}

body {
	line-height: 1.5;
	white-space: pre-wrap;
}

a,
a.visited {
	color: inherit;
	text-decoration: underline;
}

.pdf-relative-link-path {
	font-size: 80%;
	color: #444;
}

h1,
h2,
h3 {
	letter-spacing: -0.01em;
	line-height: 1.2;
	font-weight: 600;
	margin-bottom: 0;
}

.page-title {
	font-size: 2.5rem;
	font-weight: 700;
	margin-top: 0;
	margin-bottom: 0.75em;
}

h1 {
	font-size: 1.875rem;
	margin-top: 1.875rem;
}

h2 {
	font-size: 1.5rem;
	margin-top: 1.5rem;
}

h3 {
	font-size: 1.25rem;
	margin-top: 1.25rem;
}

.source {
	border: 1px solid #ddd;
	border-radius: 3px;
	padding: 1.5em;
	word-break: break-all;
}

.callout {
	border-radius: 3px;
	padding: 1rem;
}

figure {
	margin: 1.25em 0;
	page-break-inside: avoid;
}

figcaption {
	opacity: 0.5;
	font-size: 85%;
	margin-top: 0.5em;
}

mark {
	background-color: transparent;
}

.indented {
	padding-left: 1.5em;
}

hr {
	background: transparent;
	display: block;
	width: 100%;
	height: 1px;
	visibility: visible;
	border: none;
	border-bottom: 1px solid rgba(55, 53, 47, 0.09);
}

img {
	max-width: 100%;
}

@media only print {
	img {
		max-height: 100vh;
		object-fit: contain;
	}
}

@page {
	margin: 1in;
}

.collection-content {
	font-size: 0.875rem;
}

.column-list {
	display: flex;
	justify-content: space-between;
}

.column {
	padding: 0 1em;
}

.column:first-child {
	padding-left: 0;
}

.column:last-child {
	padding-right: 0;
}

.table_of_contents-item {
	display: block;
	font-size: 0.875rem;
	line-height: 1.3;
	padding: 0.125rem;
}

.table_of_contents-indent-1 {
	margin-left: 1.5rem;
}

.table_of_contents-indent-2 {
	margin-left: 3rem;
}

.table_of_contents-indent-3 {
	margin-left: 4.5rem;
}

.table_of_contents-link {
	text-decoration: none;
	opacity: 0.7;
	border-bottom: 1px solid rgba(55, 53, 47, 0.18);
}

table,
th,
td {
	border: 1px solid rgba(55, 53, 47, 0.09);
	border-collapse: collapse;
}

table {
	border-left: none;
	border-right: none;
}

th,
td {
	font-weight: normal;
	padding: 0.25em 0.5em;
	line-height: 1.5;
	min-height: 1.5em;
	text-align: left;
}

th {
	color: rgba(55, 53, 47, 0.6);
}

ol,
ul {
	margin: 0;
	margin-block-start: 0.6em;
	margin-block-end: 0.6em;
}

li > ol:first-child,
li > ul:first-child {
	margin-block-start: 0.6em;
}

ul > li {
	list-style: disc;
}

ul.to-do-list {
	padding-inline-start: 0;
}

ul.to-do-list > li {
	list-style: none;
}

.to-do-children-checked {
	text-decoration: line-through;
	opacity: 0.375;
}

ul.toggle > li {
	list-style: none;
}

ul {
	padding-inline-start: 1.7em;
}

ul > li {
	padding-left: 0.1em;
}

ol {
	padding-inline-start: 1.6em;
}

ol > li {
	padding-left: 0.2em;
}

.mono ol {
	padding-inline-start: 2em;
}

.mono ol > li {
	text-indent: -0.4em;
}

.toggle {
	padding-inline-start: 0em;
	list-style-type: none;
}

/* Indent toggle children */
.toggle > li > details {
	padding-left: 1.7em;
}

.toggle > li > details > summary {
	margin-left: -1.1em;
}

.selected-value {
	display: inline-block;
	padding: 0 0.5em;
	background: rgba(206, 205, 202, 0.5);
	border-radius: 3px;
	margin-right: 0.5em;
	margin-top: 0.3em;
	margin-bottom: 0.3em;
	white-space: nowrap;
}

.collection-title {
	display: inline-block;
	margin-right: 1em;
}

.simple-table {
	margin-top: 1em;
	font-size: 0.875rem;
	empty-cells: show;
}
.simple-table td {
	height: 29px;
	min-width: 120px;
}

.simple-table th {
	height: 29px;
	min-width: 120px;
}

.simple-table-header-color {
	background: rgb(247, 246, 243);
	color: black;
}
.simple-table-header {
	font-weight: 500;
}

time {
	opacity: 0.5;
}

.icon {
	display: inline-block;
	max-width: 1.2em;
	max-height: 1.2em;
	text-decoration: none;
	vertical-align: text-bottom;
	margin-right: 0.5em;
}

img.icon {
	border-radius: 3px;
}

.user-icon {
	width: 1.5em;
	height: 1.5em;
	border-radius: 100%;
	margin-right: 0.5rem;
}

.user-icon-inner {
	font-size: 0.8em;
}

.text-icon {
	border: 1px solid #000;
	text-align: center;
}

.page-cover-image {
	display: block;
	object-fit: cover;
	width: 100%;
	max-height: 30vh;
}

.page-header-icon {
	font-size: 3rem;
	margin-bottom: 1rem;
}

.page-header-icon-with-cover {
	margin-top: -0.72em;
	margin-left: 0.07em;
}

.page-header-icon img {
	border-radius: 3px;
}

.link-to-page {
	margin: 1em 0;
	padding: 0;
	border: none;
	font-weight: 500;
}

p > .user {
	opacity: 0.5;
}

td > .user,
td > time {
	white-space: nowrap;
}

input[type="checkbox"] {
	transform: scale(1.5);
	margin-right: 0.6em;
	vertical-align: middle;
}

p {
	margin-top: 0.5em;
	margin-bottom: 0.5em;
}

.image {
	border: none;
	margin: 1.5em 0;
	padding: 0;
	border-radius: 0;
	text-align: center;
}

.code,
code {
	background: rgba(135, 131, 120, 0.15);
	border-radius: 3px;
	padding: 0.2em 0.4em;
	border-radius: 3px;
	font-size: 85%;
	tab-size: 2;
}

code {
	color: #eb5757;
}

.code {
	padding: 1.5em 1em;
}

.code-wrap {
	white-space: pre-wrap;
	word-break: break-all;
}

.code > code {
	background: none;
	padding: 0;
	font-size: 100%;
	color: inherit;
}

blockquote {
	font-size: 1.25em;
	margin: 1em 0;
	padding-left: 1em;
	border-left: 3px solid rgb(55, 53, 47);
}

.bookmark {
	text-decoration: none;
	max-height: 8em;
	padding: 0;
	display: flex;
	width: 100%;
	align-items: stretch;
}

.bookmark-title {
	font-size: 0.85em;
	overflow: hidden;
	text-overflow: ellipsis;
	height: 1.75em;
	white-space: nowrap;
}

.bookmark-text {
	display: flex;
	flex-direction: column;
}

.bookmark-info {
	flex: 4 1 180px;
	padding: 12px 14px 14px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.bookmark-image {
	width: 33%;
	flex: 1 1 180px;
	display: block;
	position: relative;
	object-fit: cover;
	border-radius: 1px;
}

.bookmark-description {
	color: rgba(55, 53, 47, 0.6);
	font-size: 0.75em;
	overflow: hidden;
	max-height: 4.5em;
	word-break: break-word;
}

.bookmark-href {
	font-size: 0.75em;
	margin-top: 0.25em;
}

.sans { font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol"; }
.code { font-family: "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace; }
.serif { font-family: Lyon-Text, Georgia, ui-serif, serif; }
.mono { font-family: iawriter-mono, Nitti, Menlo, Courier, monospace; }
.pdf .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK JP'; }
.pdf:lang(zh-CN) .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK SC'; }
.pdf:lang(zh-TW) .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK TC'; }
.pdf:lang(ko-KR) .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK KR'; }
.pdf .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK JP'; }
.pdf:lang(zh-CN) .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC'; }
.pdf:lang(zh-TW) .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK TC'; }
.pdf:lang(ko-KR) .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK KR'; }
.pdf .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK JP'; }
.pdf:lang(zh-CN) .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK SC'; }
.pdf:lang(zh-TW) .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK TC'; }
.pdf:lang(ko-KR) .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK KR'; }
.pdf .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK JP'; }
.pdf:lang(zh-CN) .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC'; }
.pdf:lang(zh-TW) .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK TC'; }
.pdf:lang(ko-KR) .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK KR'; }
.highlight-default {
	color: rgba(55, 53, 47, 1);
}
.highlight-gray {
	color: rgba(120, 119, 116, 1);
	fill: rgba(120, 119, 116, 1);
}
.highlight-brown {
	color: rgba(159, 107, 83, 1);
	fill: rgba(159, 107, 83, 1);
}
.highlight-orange {
	color: rgba(217, 115, 13, 1);
	fill: rgba(217, 115, 13, 1);
}
.highlight-yellow {
	color: rgba(203, 145, 47, 1);
	fill: rgba(203, 145, 47, 1);
}
.highlight-teal {
	color: rgba(68, 131, 97, 1);
	fill: rgba(68, 131, 97, 1);
}
.highlight-blue {
	color: rgba(51, 126, 169, 1);
	fill: rgba(51, 126, 169, 1);
}
.highlight-purple {
	color: rgba(144, 101, 176, 1);
	fill: rgba(144, 101, 176, 1);
}
.highlight-pink {
	color: rgba(193, 76, 138, 1);
	fill: rgba(193, 76, 138, 1);
}
.highlight-red {
	color: rgba(212, 76, 71, 1);
	fill: rgba(212, 76, 71, 1);
}
.highlight-gray_background {
	background: rgba(241, 241, 239, 1);
}
.highlight-brown_background {
	background: rgba(244, 238, 238, 1);
}
.highlight-orange_background {
	background: rgba(251, 236, 221, 1);
}
.highlight-yellow_background {
	background: rgba(251, 243, 219, 1);
}
.highlight-teal_background {
	background: rgba(237, 243, 236, 1);
}
.highlight-blue_background {
	background: rgba(231, 243, 248, 1);
}
.highlight-purple_background {
	background: rgba(244, 240, 247, 0.8);
}
.highlight-pink_background {
	background: rgba(249, 238, 243, 0.8);
}
.highlight-red_background {
	background: rgba(253, 235, 236, 1);
}
.block-color-default {
	color: inherit;
	fill: inherit;
}
.block-color-gray {
	color: rgba(120, 119, 116, 1);
	fill: rgba(120, 119, 116, 1);
}
.block-color-brown {
	color: rgba(159, 107, 83, 1);
	fill: rgba(159, 107, 83, 1);
}
.block-color-orange {
	color: rgba(217, 115, 13, 1);
	fill: rgba(217, 115, 13, 1);
}
.block-color-yellow {
	color: rgba(203, 145, 47, 1);
	fill: rgba(203, 145, 47, 1);
}
.block-color-teal {
	color: rgba(68, 131, 97, 1);
	fill: rgba(68, 131, 97, 1);
}
.block-color-blue {
	color: rgba(51, 126, 169, 1);
	fill: rgba(51, 126, 169, 1);
}
.block-color-purple {
	color: rgba(144, 101, 176, 1);
	fill: rgba(144, 101, 176, 1);
}
.block-color-pink {
	color: rgba(193, 76, 138, 1);
	fill: rgba(193, 76, 138, 1);
}
.block-color-red {
	color: rgba(212, 76, 71, 1);
	fill: rgba(212, 76, 71, 1);
}
.block-color-gray_background {
	background: rgba(241, 241, 239, 1);
}
.block-color-brown_background {
	background: rgba(244, 238, 238, 1);
}
.block-color-orange_background {
	background: rgba(251, 236, 221, 1);
}
.block-color-yellow_background {
	background: rgba(251, 243, 219, 1);
}
.block-color-teal_background {
	background: rgba(237, 243, 236, 1);
}
.block-color-blue_background {
	background: rgba(231, 243, 248, 1);
}
.block-color-purple_background {
	background: rgba(244, 240, 247, 0.8);
}
.block-color-pink_background {
	background: rgba(249, 238, 243, 0.8);
}
.block-color-red_background {
	background: rgba(253, 235, 236, 1);
}
.select-value-color-pink { background-color: rgba(245, 224, 233, 1); }
.select-value-color-purple { background-color: rgba(232, 222, 238, 1); }
.select-value-color-green { background-color: rgba(219, 237, 219, 1); }
.select-value-color-gray { background-color: rgba(227, 226, 224, 1); }
.select-value-color-translucentGray { background-color: rgba(255, 255, 255, 0.0375); }
.select-value-color-orange { background-color: rgba(250, 222, 201, 1); }
.select-value-color-brown { background-color: rgba(238, 224, 218, 1); }
.select-value-color-red { background-color: rgba(255, 226, 221, 1); }
.select-value-color-yellow { background-color: rgba(253, 236, 200, 1); }
.select-value-color-blue { background-color: rgba(211, 229, 239, 1); }

.checkbox {
	display: inline-flex;
	vertical-align: text-bottom;
	width: 16;
	height: 16;
	background-size: 16px;
	margin-left: 2px;
	margin-right: 5px;
}

.checkbox-on {
	background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20width%3D%2216%22%20height%3D%2216%22%20fill%3D%22%2358A9D7%22%2F%3E%0A%3Cpath%20d%3D%22M6.71429%2012.2852L14%204.9995L12.7143%203.71436L6.71429%209.71378L3.28571%206.2831L2%207.57092L6.71429%2012.2852Z%22%20fill%3D%22white%22%2F%3E%0A%3C%2Fsvg%3E");
}

.checkbox-off {
	background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20x%3D%220.75%22%20y%3D%220.75%22%20width%3D%2214.5%22%20height%3D%2214.5%22%20fill%3D%22white%22%20stroke%3D%22%2336352F%22%20stroke-width%3D%221.5%22%2F%3E%0A%3C%2Fsvg%3E");
}
	
</style>
</head>
<body>
<article id="5d2b9e35-bff8-43f1-a1e9-ae73b090fa2f" class="page sans">
<header>
<div class="page-header-icon undefined">
<span class="icon">🖥️</span>
</div>
<h1 class="page-title" style="margin-bottom: -30px">2023년 SQL 학습 기록장</h1>
</header>
<div class="page-body">
<h1 style="width: 50%; display: inline-block">개념 및 이론, 책 정리</h1>
<hr style="background-color:black; height:1px; width : 100%; display: inline-block" >
<figure id="15eef7e3-af89-4e00-9e35-082ae1f5fa82" class="link-to-page">
<a href="./summary/database"><span class="icon">🛫</span>데이터베이스 입문</a></figure>

<h1 style="width: 50%; display: inline-block">문제 풀이</h1>
<hr style="background-color:black; height:1px; width : 100%; display: inline-block" >

<div class="card" style = "padding-left:30px; padding-bottom: 50px; box-shadow: 1px 3px 3px lightgrey;">
	<h3 id="20bfeb1e-1257-41cf-adbd-37757f81c26d" class="" style="margin-bottom: -50px; padding: 10px; color: black">1월</h3>
	<div id="dcf89e6f-28fe-4283-b967-03ec5432e3a5" class="column-list" >
	<div id="68487945-d579-4628-9690-a1d8fed36ad9" style="width:33.333333333333336%" class="column">
	<figure id="4885214e-185a-4b97-bc06-79f9e90f3740" class="link-to-page">
	<a href="2023-01-07%204885214e185a4b97bc0679f9e90f3740.html"><span class="icon">🃏</span>2023-01-07</a></figure></div>
	<div id="9cd905a0-9153-4864-9a2b-ad9943d36b81" style="width:33.333333333333336%" class="column">
	<figure id="e4b81d18-52db-4411-af3b-2a7226a373b5" class="link-to-page">
	<a href="2023-01-08%20e4b81d1852db4411af3b2a7226a373b5.html"><span class="icon">🎮</span>2023-01-08</a>
	</figure></div>
	<div id="5ccbf0ae-c7a6-4ff9-93cb-f58abaeafa3d" style="width:33.33333333333333%" class="column">
	<figure id="577537db-53cc-42c4-81ab-aa2ba4a3e309" class="link-to-page">
	<a href="2023-01-11%20577537db53cc42c481abaa2ba4a3e309.html"><span class="icon">⌛</span>2023-01-11</a></figure></div></div>
	<div id="b7e70fe0-d4aa-478b-b09d-90cbce4be46c" class="column-list">
	<div id="e2a1a17d-ef3a-43a3-8d86-e14b39b57034" style="width:33.333333333333336%" class="column">
	<figure id="6e338db4-e123-4fb5-9c8c-7f7115bbaa6a" class="link-to-page">
	<a href="2022-01-15%206e338db4e1234fb59c8c7f7115bbaa6a.html"><span class="icon">🔬</span>2022-01-15 </a></figure></div>
	<div id="ed78c99c-8c3c-49e8-9982-b7e9b9a08b9b" style="width:33.333333333333336%" class="column">
	<figure id="47a65dcd-18a2-420c-aed0-0bc5a25e398f" class="link-to-page">
	<a href="2023-01-19%2047a65dcd18a2420caed00bc5a25e398f.html"><span class="icon">🥘</span>2023-01-19</a></figure></div>
	<div id="2dfb3cf4-285f-4147-8146-c111a841c643" style="width:33.33333333333333%" class="column">
	<figure id="add5f001-207e-4f92-a2b8-4068381ff2dc" class="link-to-page">
	<a href="2023-01-30%20add5f001207e4f92a2b84068381ff2dc.html"><span class="icon">🎭</span>2023-01-30</a></figure></div></div>
</div>
<div class="card" style = "padding-left:30px; padding-bottom: 50px; box-shadow: 1px 3px 3px lightgrey;">
	<h3 id="400278c6-3bbc-4b5a-9fef-1e57bca831f8" class="" style="margin-bottom: -50px; padding: 10px; color: black">2월</h3>
	<div id="c1f7cd3c-0c7b-4a78-b366-abe83250ce08" class="column-list">
	<div id="7b1fe9ef-3553-4c86-bb06-44dadc1ee085" style="width:50%" class="column">
	<figure id="758a36c8-f6d6-42bc-9614-50a30681a7b0" class="link-to-page">
	<a href="2023-02-16%20758a36c8f6d642bc961450a30681a7b0.html"><span class="icon">🦼</span>2023-02-16</a>
	</figure></div><div id="75054505-a18d-48e5-99d9-611a44c4fe7f" style="width:50%" class="column">
	<figure id="c71c9d20-7336-4d2a-9e90-acc5e1b88f35" class="link-to-page">
	<a href="2023-02-17%20c71c9d2073364d2a9e90acc5e1b88f35.html"><span class="icon">💟</span>2023-02-17</a></figure></div></div>
</div>
<div class="card" style = "padding-left:30px; padding-bottom: 50px; box-shadow: 1px 3px 3px lightgrey;">
<h3 id="ea99cbf7-0abb-422e-896a-d2823d6123e0" class="" style="margin-bottom: -50px; padding: 10px; color: black">3월</h3>
<div id="a8b5bafb-03de-4721-9d90-7e21bcff7634" class="column-list">
<div id="034f3a11-9024-44d4-a5fe-fb8b5d7614ff" style="width:33.333333333333336%" class="column">
<figure id="15e75496-d4ab-423d-98fa-80a0859b3511" class="link-to-page">
<a href="2023-03-20%2015e75496d4ab423d98fa80a0859b3511.html"><span class="icon">💋</span>2023-03-20</a></figure></div>
<div id="d05d6501-5461-4fdb-91b2-ae6a9aa5d3c6" style="width:33.333333333333336%" class="column">
<figure id="a0cb20f2-33fb-47f0-a8ed-a062af029ad1" class="link-to-page">
<a href="2023-03-21%20a0cb20f233fb47f0a8eda062af029ad1.html"><span class="icon">🥰</span>2023-03-21</a>
</figure></div>
<div id="4abc8518-c516-4278-aac8-c6e8711b6ef4" style="width:33.33333333333333%" class="column">
<figure id="35e0b438-5475-4507-ba89-c507bf72a839" class="link-to-page">
<a href="2023-03-22%2035e0b43854754507ba89c507bf72a839.html"><span class="icon">🤓</span>2023-03-22</a></figure></div></div>
</div>
<div class="card" style = "padding-left:30px; padding-bottom: 50px; box-shadow: 1px 3px 3px lightgrey;">
<h3 id="b5e01853-d6a1-482d-940a-bf6eaa4c86c8" class="" style="margin-bottom:-30px; padding: 10px; color: black">4월</h3>
<br>
<div id="f80ceaf3-9499-4f5b-a0c3-618209cbed13" class="column-list" >
<div id="8ec9c8f0-784b-4b88-92a0-cf13490f419f" style="width:50%" class="column" >
<a href="23-04-06%2096268569295d4a2e9859c517dc0846fa.html"><span class="icon">🥰</span>23-04-06</a>
</div>
<div id="60a954b5-3fbe-41da-bc6c-e33ad2ee35a3" style="width:50%" class="column">
<a href="23-04-24%204c5237b173124c539f182e596c00a5b3.html"><span class="icon">🤓</span>23-04-21</a>
</div>
</div>
<br>
<div style="margin-top:-60px" id="f80ceaf3-9499-4f5b-a0c3-618209cbed17" class="column-list" >
<div id="8ec9c8f0-784b-4b88-92a0-cf13490f419f" style="width:50%" class="column" >
<figure id="b6d7abcb-2df8-40ae-9ad2-b8634f834f67" class="link-to-page">
<a href="23-04-21%20b6d7abcb2df840ae9ad2b8634f834f67.html"><span class="icon">🍖</span>23-04-24</a></figure></div>
<div id="60a954b5-3fbe-41da-bc6c-e33ad2ee35a4" style="width:50%" class="column">
<figure id="4c5237b1-7312-4c53-9f18-2e596c00a5b3" class="link-to-page">
<a href="23-04-24%204c5237b173124c539f182e596c00a5b3.html"><span class="icon">🎈</span>23-04-25</a></figure></div></div>
</div>
<p id="96a52cf9-1407-4590-bbb4-6444e5c0c14c" class="">
</p></article></body></html>