SELECT
  `dev`.`User`.`id`,
  `dev`.`User`.`email`,
  `dev`.`User`.`name`
FROM
  `dev`.`User`
WHERE
  (
    `dev`.`User`.`email` = ?
    AND 1 = 1
  )
LIMIT
  ?
OFFSET
  ?;

-- Params: ["alice@prisma.io",1,0]
SELECT
  `dev`.`Post`.`id`,
  `dev`.`Post`.`createdAt`,
  `dev`.`Post`.`updatedAt`,
  `dev`.`Post`.`title`,
  `dev`.`Post`.`content`,
  `dev`.`Post`.`published`,
  `dev`.`Post`.`authorId`
FROM
  `dev`.`Post`
WHERE
  `dev`.`Post`.`authorId` IN (?);

-- Params: [1]
SELECT
  `dev`.`Profile`.`id`,
  `dev`.`Profile`.`bio`,
  `dev`.`Profile`.`userId`
FROM
  `dev`.`Profile`
WHERE
  `dev`.`Profile`.`userId` IN (?);

--  Params: [1]