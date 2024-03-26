# Prisma

[Prisma Command Reference](https://www.prisma.io/docs/reference/api-reference/command-reference)

## Setup

### .env の作成

```
cp .env.dev .env
```

### DB 起動

```
docker compose up -d
```

### 依存パッケージのインストール

```
yarn
```

### Database 作成

```
yarn prisma:migrate
```

### 初期データ 作成

```
yarn prisma:seed
```

### PrismaClient などのアセットを生成

```
yarn prisma:generate
```

## SQL Log

```typescript
const user = await prisma.user.findUnique({
  where: { email: "alice@prisma.io" },
  include: {
    posts: true,
    profile: true,
  },
});

// relationLoadStrategy: "join",
// Query: SELECT `t1`.`id`, `t1`.`email`, `t1`.`name`, (SELECT COALESCE(JSON_ARRAYAGG(`__prisma_data__`), CONVERT('[]', JSON)) AS `__prisma_data__` FROM (SELECT `t4`.`__prisma_data__` FROM (SELECT JSON_OBJECT('id', `t3`.`id`, 'createdAt', `t3`.`createdAt`, 'updatedAt', `t3`.`updatedAt`, 'title', `t3`.`title`, 'content', `t3`.`content`, 'published', `t3`.`published`, 'authorId', `t3`.`authorId`) AS `__prisma_data__` FROM (SELECT `t2`.* FROM `dev`.`Post` AS `t2` WHERE `t1`.`id` = `t2`.`authorId` /* root select */) AS `t3` /* inner select */) AS `t4` /* middle select */) AS `t5` /* outer select */) AS `posts`, (SELECT JSON_OBJECT('id', `t6`.`id`, 'bio', `t6`.`bio`, 'userId', `t6`.`userId`) FROM `dev`.`Profile` AS `t6` WHERE `t1`.`id` = `t6`.`userId` LIMIT ?) AS `profile` FROM `dev`.`User` AS `t1` WHERE (`t1`.`email` = ? AND 1=1) LIMIT ?
// Params: [1,"alice@prisma.io",1]

// relationLoadStrategy: "query",
// Query: SELECT `dev`.`User`.`id`, `dev`.`User`.`email`, `dev`.`User`.`name` FROM `dev`.`User` WHERE (`dev`.`User`.`email` = ? AND 1=1) LIMIT ? OFFSET ?
// Params: ["alice@prisma.io",1,0]
// Query: SELECT `dev`.`Post`.`id`, `dev`.`Post`.`createdAt`, `dev`.`Post`.`updatedAt`, `dev`.`Post`.`title`, `dev`.`Post`.`content`, `dev`.`Post`.`published`, `dev`.`Post`.`authorId` FROM `dev`.`Post` WHERE `dev`.`Post`.`authorId` IN (?)
// Params: [1]
// Query: SELECT `dev`.`Profile`.`id`, `dev`.`Profile`.`bio`, `dev`.`Profile`.`userId` FROM `dev`.`Profile` WHERE `dev`.`Profile`.`userId` IN (?)
// Params: [1]
```
