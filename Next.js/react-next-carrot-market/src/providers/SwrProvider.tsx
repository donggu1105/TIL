"use client";
import { ReactNode } from "react";
import { SWRConfig } from "swr";

type Props = {
    children: ReactNode;
};

type FetcherResponse = Promise<any>; // Replace `any` with the expected response type

type Fetcher = (...args: Parameters<typeof fetch>) => FetcherResponse;

export const fetcher: Fetcher = (...args) =>
    fetch(...args).then((response) => response.json());

function SwrProvider({ children }: Props) {
    return <SWRConfig value={{ fetcher }}>{children}</SWRConfig>;
}

export default SwrProvider;
