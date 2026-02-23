import { formatDiagnosticMessage } from "@pretty-ts-errors/formatter";
import { writeFileSync } from "node:fs";

writeFileSync("./temp", "started");
// const chunks: any[] = [];
// for await (const chunk of process.stdin) chunks.push(chunk);
// const input = Buffer.concat(chunks).toString("utf8").trim();
// console.log("(index.ts:6) input:", input);
// writeFileSync("./temp", input);
