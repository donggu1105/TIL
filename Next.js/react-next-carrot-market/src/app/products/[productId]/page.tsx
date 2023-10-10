
import getCurrentUser from "@/app/actions/getCurrentUser";
import getProductById from "@/app/actions/getProductById";

import ProductClient from "./ProductClient";
import EmptyState from "@/components/EmptyState";

interface IParams {
  productId?: string;
}

const ProductPage = async ({ params }: { params: IParams }) => {

  const product = await getProductById(params);
  const currentUser = await getCurrentUser();

  if (!product) {
    return (
      <EmptyState />
    );
  }

  return (
    <ProductClient
      product={product}
      currentUser={currentUser}
    />
  );
}

export default ProductPage;


