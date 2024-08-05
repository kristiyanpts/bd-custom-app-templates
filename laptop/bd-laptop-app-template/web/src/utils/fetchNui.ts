import { isEnvBrowser } from "./misc";
let resourceName = "bd-laptop-app-template";

export async function fetchNui<T = unknown>(
  eventName: string,
  data?: unknown,
  mockData?: T,
): Promise<T> {
  const options = {
    method: "post",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify(data),
  };
  if (isEnvBrowser() && mockData) return mockData;
  const resp = await fetch(`https://${resourceName}/${eventName}`, options);
  const respFormatted = await resp.json();
  return respFormatted;
}