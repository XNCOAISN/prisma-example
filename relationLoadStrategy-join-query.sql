SELECT
  `t1`.`id`,
  `t1`.`email`,
  `t1`.`name`,
  (
    SELECT
      COALESCE(
        JSON_ARRAYAGG (`__prisma_data__`),
        CONVERT('[]', JSON)
      ) AS `__prisma_data__`
    FROM
      (
        SELECT
          `t4`.`__prisma_data__`
        FROM
          (
            SELECT
              JSON_OBJECT (
                'id',
                `t3`.`id`,
                'createdAt',
                `t3`.`createdAt`,
                'updatedAt',
                `t3`.`updatedAt`,
                'title',
                `t3`.`title`,
                'content',
                `t3`.`content`,
                'published',
                `t3`.`published`,
                'authorId',
                `t3`.`authorId`
              ) AS `__prisma_data__`
            FROM
              (
                SELECT
                  `t2`.*
                FROM
                  `dev`.`Post` AS `t2`
                WHERE
                  `t1`.`id` = `t2`.`authorId` /* root select */
              ) AS `t3` /* inner select */
          ) AS `t4` /* middle select */
      ) AS `t5` /* outer select */
  ) AS `posts`,
  (
    SELECT
      JSON_OBJECT (
        'id',
        `t6`.`id`,
        'bio',
        `t6`.`bio`,
        'userId',
        `t6`.`userId`
      )
    FROM
      `dev`.`Profile` AS `t6`
    WHERE
      `t1`.`id` = `t6`.`userId`
    LIMIT
      ?
  ) AS `profile`
FROM
  `dev`.`User` AS `t1`
WHERE
  (
    `t1`.`email` = ?
    AND 1 = 1
  )
LIMIT
  ?;

-- Params: [1,"alice@prisma.io",1]