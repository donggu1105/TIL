import '../../domain/model/display/display.model.dart';
import '../dto/display/display.dto.dart';
import '../entity/display/display.entity.dart';

extension MenuEx on MenuDto {
  Menu toModel() {
    return Menu(
      tabId: tabId ?? 0,
      title: title ?? '',
    );
  }
}

extension ViewModuleDtoEx on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(
      type: type ?? '',
      title: title ?? '',
      subtitle: subtitle ?? '',
      imageUrl: imageUrl ?? '',
      time: time ?? -1,
      products: products?.map((dto) => dto.toModel()).toList() ?? [],
      tabs: tabs ?? [],
    );
  }
}

extension ProductInfoDtoEx on ProductInfoDto {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId ?? '',
      title: title ?? '',
      subtitle: subtitle ?? '',
      imageUrl: imageUrl ?? '',
      price: price ?? -1,
      originalPrice: originalPrice ?? -1,
      discrountRate: discountRate ?? -1,
      reviewCount: reviewCount ?? -1,
    );
  }
}

/// MODEL -> ENTITY
extension ProductInfoEx on ProductInfo {
  ProductInfoEntity toEntity() {
    return ProductInfoEntity(
      productId: productId,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discountRate: discrountRate,
      reviewCount: reviewCount,
    );
  }
}

/// Entity -> MODEL
extension ProductInfoEntityEx on ProductInfoEntity {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discrountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

/// Entity -> MODEL
extension CartEntityEx on CartEntity {
  Cart toModel() {
    return Cart(quantity: quantity, product: product.toModel());
  }
}

extension CartEx on Cart {
  CartEntity toEntity() {
    return CartEntity(product: product.toEntity(), quantity: quantity);
  }
}
