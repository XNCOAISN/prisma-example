import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({ log: [{ emit: "event", level: "query" }] });
prisma.$on("query", (e) => {
  console.log("Query: " + e.query);
  console.log("Params: " + e.params);
  console.log("Duration: " + e.duration + "ms");
});

async function main() {
  const user = await prisma.user.findUnique({
    where: { email: "alice@prisma.io" },
    include: {
      posts: true,
      profile: true,
    },
  });
  console.log(user);
}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
