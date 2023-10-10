'use client'
import { PRODUCTS_PER_PAGE } from "@/constants";
import usePagination from "@lucasmogari/react-pagination";
import cn from "classnames";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import React, { memo, PropsWithChildren } from "react";
import qs from 'query-string';
interface PaginationProps {
    page: number;
    totalItems: number;
    perPage: number;
};

const Pagination = ({ page, totalItems, perPage }: PaginationProps) => {
    // use the usePagination hook
    // getPageItem - function that returns the type of page based on the index.
    // size - the number of pages
    const { getPageItem, totalPages } = usePagination({
        totalItems: totalItems,
        page: page,
        itemsPerPage: perPage,
        maxPageItems: 3,
    });

    const firstPage = 1;
    // calculate the next page
    const nextPage = Math.min(page + 1, totalPages);
    // calculate the previous page
    const prevPage = Math.max(page - 1, firstPage);
    // create a new array based on the total pages
    const arr = new Array(totalPages + 2);

    return (
        <div className="flex items-center justify-center gap-2 mt-4">
            {[...arr].map((_, i) => {
                // getPageItem function returns the type of page based on the index.
                // it also automatically calculates if the page is disabled.
                const { page, disabled, current } = getPageItem(i);
                if (page === "previous") {
                    return (
                        <PaginationLink page={prevPage} disabled={disabled} key={page}>
                            {`<`}
                        </PaginationLink>
                    );
                }

                if (page === "gap") {
                    return <span key={`${page}-${i}`}>...</span>;
                }

                if (page === "next") {
                    return (
                        <PaginationLink page={nextPage} disabled={disabled} key={page}>
                            {`>`}
                        </PaginationLink>
                    );
                }

                if (!page) return null;

                return (
                    <PaginationLink active={current} key={page} page={page!}>
                        {page}
                    </PaginationLink>
                );
            })}
        </div>
    );
};

type PaginationLinkProps = {
    page?: number | string;
    active?: boolean;
    disabled?: boolean;
} & PropsWithChildren;

function PaginationLink({ page, children, ...props }: PaginationLinkProps) {
    const params = useSearchParams();
    const limit = PRODUCTS_PER_PAGE;
    const skip = page ? (Number(page) - 1) * limit : 0;

    let currentQuery = {};

    if (params) {
        currentQuery = qs.parse(params.toString())
    }

    // we use existing data from router query, we just modify the page.
    const updatedQuery: any = {
        ...currentQuery,
        page,
        skip
    }

    return (
        <Link
            // only use the query for the url, it will only modify the query, won't modify the route.
            href={{ query: updatedQuery }}
            // toggle the appropriate classes based on active, disabled states.
            className={cn({
                "p-2": true,
                "font-bold text-orange-500": props.active,
                "text-gray-500": !props.active,
                "pointer-events-none text-gray-200": props.disabled,
            })}
        >
            {children}
        </Link>
    );
}
export default memo(Pagination);
