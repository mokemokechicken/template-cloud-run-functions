import type { HttpFunction } from "@google-cloud/functions-framework";

export const helloGET: HttpFunction = (req, res) => {
	res.send("Hello, World!");
};

