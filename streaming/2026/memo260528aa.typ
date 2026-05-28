#set text(font: "Noto Sans CJK SC", size: 10pt)
#set page(margin: 20mm)


#align(center)[
  #text(size: 15pt)[
    Fake Journal Data Management System Bootstrap Plan \
    Fake 期刊数据管理系统初始化方案
  ]

  `memo260528aa.pdf`
]
#set heading(numbering: "1.1.1.1.1.1.1. ")


= 方案范围
本方案意图涵盖投稿审稿、PDF 产物构建环节，用 GitHub 的代码仓库和 issue 功能管理相关数据，用最小的金钱/开发量代价跑通核心工作流。


= 办事流程

== 作者投稿
选项包括：

- 自行创建 issue 并将投稿（Typst/LaTeX/Markdown/PDF/Word）文件作为附件上传。
- 邮箱发送到 submission\@example.com。

== 编辑收稿
- 作者没自行创建 issue 的，编辑负责创建 issue。
- 将 issue 添加 `NewManuscript` 标签。
- 编辑将文章录入 Git 仓库 `/database/{year}/{id}/manuscript.typ` 并创建 NewManuscript 阶段的 PDF（`manuscript.pdf`），并上传到 issue 评论区。
- 还有其他技术性操作，细节另行记载。
- 将来可以在这个环节分配 DOI。

== 观光团审稿
- 暂不设编辑之外的审稿人。
- 观光团对 issue 本体点 emoji reaction 来表态。
- 将来可以调整为审稿人团。

== 单文收录
- 编辑认为已经过审。
- 为 issue 添加 `AcceptedSingle` 标签，移除 `NewManuscript` 标签。

== 网站上传
- 这个阶段可以将 `single.pdf` 上传到网站了。
- 具体技术选型待定。

== 见刊发表
- 为 issue 添加 `Published` 标签，移除 `AcceptedSingle` 标签。
- 构建当期全本 PDF，并拆分出每篇文章对应的页码范围。具体技术选型待定。




= 投稿生命周期
一篇投稿可能处于以下状态：

- NewManuscript
  - 此状态下，可以细分 NeedEditorReview、NeedAuthorRevision
- AcceptedSingle
- Published

