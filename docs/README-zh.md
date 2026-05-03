
<h1 align="center">
AcadHomepage
</h1>

<div align="center">

[![](https://img.shields.io/github/stars/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/forks/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/issues/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/license/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io/blob/main/LICENSE)  | [English README](../README.md) 

</div>

<p align="center">一个现代、响应式的个人学术主页</p>


<p align="center">
    <br>
    <img src="./screenshot.png" width="100%"/>
    <br>
</p>

一些例子：
- [样例页面](https://rayeren.github.io/acad-homepage.github.io/)
- [作者的个人主页](https://rayeren.github.io/)

## 主要特点
- **自动更新谷歌学术引用**: 借助谷歌学术爬虫和github action功能，本仓库可以自动更新作者的引用数和论文引用数。
- **支持谷歌Analytics**: 你可以通过简单的配置来实现使用谷歌Analytics跟踪网页的流量。
- **响应式的**: 此主页会针对不同的屏幕尺寸自动调整布局。
- **美观而简约**: 此主页美观而简约，适合个人学术主页的搭建。
- **搜索引擎优化**: 搜索引擎优化 (SEO) 帮助搜索引擎轻松找到您在主页上发布的信息，然后将其与类似网站进行排名，并获得排名优势。

## 快速开始

1. Fork 本仓库，并将仓库名改成 `USERNAME.github.io`，其中 `USERNAME` 是你的 GitHub 用户名。
1. 修改配置文件 [`_config.yml`](../_config.yml)：
   1. `title`：主页标题
   1. `description`：主页描述
   1. `repository`：填写成 `USERNAME/USERNAME.github.io`
   1. `author`：头像、邮箱、GitHub、所在地、个人简介
   1. `google_analytics_id` 和 SEO 验证项：按需填写
1. 修改主页内容：
   1. 主页入口文件是 [`_pages/about.md`](../_pages/about.md)
   1. 各个主页模块在 [`_pages/includes`](../_pages/includes) 目录下
1. 修改导航栏配置：[`_data/navigation.yml`](../_data/navigation.yml)
1. 博客文章统一写在 [`_posts`](../_posts) 目录下。

## 博客怎么写

这个仓库已经支持独立博客页 `/blog/` 和单篇文章页。

1. 在 [`_posts`](../_posts) 目录下新建一个 Markdown 文件。
1. 文件名格式必须是：
   ```text
   YYYY-MM-DD-your-title.md
   ```
1. 文章开头建议写成：
   ```yaml
   ---
   layout: post
   title: "你的文章标题"
   excerpt: "显示在博客列表页的一句话摘要"
   ---
   ```
1. front matter 下面直接写 Markdown 正文即可。

## 本地调试

1. 使用 `git clone` 将本项目克隆到本地。
1. 不要使用 macOS 自带的系统 Ruby，推荐使用 `rbenv` 管理 Ruby 版本。
1. 这个项目当前建议使用 `Ruby 3.1.x`。更高版本例如 `3.2+` 可能和当前 `github-pages 215` 锁定的依赖不兼容。
1. 安装并切换到项目 Ruby 版本：
   ```bash
   rbenv install 3.1.7
   rbenv local 3.1.7
   ruby -v
   ```
1. 安装项目所需的 Bundler：
   ```bash
   gem install bundler:2.2.19
   ```
1. 把依赖安装到项目目录中，而不是系统目录：
   ```bash
   bundle config set --local path 'vendor/bundle'
   ```
1. 如果你是 Apple Silicon Mac，建议补充下面几行，避免 `ffi` 编译失败：
   ```bash
   export PATH="/opt/homebrew/bin:$PATH"
   bundle config set --local build.ffi "--enable-system-libffi"
   export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
   export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
   export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
   ```
1. 安装依赖：
   ```bash
   bundle _2.2.19_ install
   ```
1. 启动本地调试服务器：
   ```bash
   ./run_server.sh
   ```
1. 在浏览器里打开 [http://127.0.0.1:4000](http://127.0.0.1:4000)。
1. 修改页面、博客、样式后，Jekyll 会自动重新生成并触发 LiveReload。

### 本地常用文件

- 主页入口：[`_pages/about.md`](../_pages/about.md)
- 主页模块：[`_pages/includes`](../_pages/includes)
- 博客列表页：[`_pages/blog.md`](../_pages/blog.md)
- 博客文章布局：[`_layouts/post.html`](../_layouts/post.html)
- 博客文章目录：[`_posts`](../_posts)
- 导航配置：[`_data/navigation.yml`](../_data/navigation.yml)
- 主样式文件：[`assets/css/main.scss`](../assets/css/main.scss)

## GitHub 上怎么部署

这个仓库已经自带 GitHub Pages 部署工作流：[`.github/workflows/jekyll.yml`](../.github/workflows/jekyll.yml)

你只需要这样配置：

1. 把代码 push 到 `main` 分支。
1. 打开 GitHub 仓库的 `Settings -> Pages`。
1. 在 `Source` 里选择 `GitHub Actions`。
1. 打开仓库的 `Actions` 标签页，确认 Actions 已启用。
1. 每次 push 到 `main`，`Deploy Jekyll site to Pages` 都会自动构建并部署。
1. 你也可以在 `Actions -> Deploy Jekyll site to Pages -> Run workflow` 手动触发一次部署。

部署成功后，主页通常会发布到：

- `https://USERNAME.github.io/`

## GitHub 上怎么配置 Google Scholar Action

仓库里还有一个可选工作流：[`.github/workflows/google_scholar_crawler.yaml`](../.github/workflows/google_scholar_crawler.yaml)

如果你想自动更新 Google Scholar 引用信息，可以这样配置：

1. 找到你的 Google Scholar ID。比如下面这个链接里的 `SCHOLAR_ID`：
   ```text
   https://scholar.google.com/citations?user=SCHOLAR_ID
   ```
1. 打开 GitHub 仓库的 `Settings -> Secrets and variables -> Actions`。
1. 新建一个 repository secret：
   - Name: `GOOGLE_SCHOLAR_ID`
   - Value: 你的 Scholar ID
1. 打开 [`.github/workflows/google_scholar_crawler.yaml`](../.github/workflows/google_scholar_crawler.yaml)，把末尾注释掉的 `env` 配置取消注释，让工作流真正读取这个 secret。
1. 打开 GitHub 的 `Actions` 页面并启用该 workflow。
1. 这个 workflow 会把生成的引用 JSON 推送到 `google-scholar-stats` 分支。

如果你暂时不需要 Google Scholar 自动更新，可以先不用开这个 workflow。

# Acknowledges

- AcadHomepage incorporates Font Awesome, which is distributed under the terms of the SIL OFL 1.1 and MIT License.
- AcadHomepage is influenced by the github repo [mmistakes/minimal-mistakes](https://github.com/mmistakes/minimal-mistakes), which is distributed under the MIT License.
- AcadHomepage is influenced by the github repo [academicpages/academicpages.github.io](https://github.com/academicpages/academicpages.github.io), which is distributed under the MIT License.
