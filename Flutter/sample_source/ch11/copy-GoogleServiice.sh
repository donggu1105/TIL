case "${CONFIGURATION}" in
  "Debug-dev"|"Release-dev" )
    cp -r "${PROJECT_DIR}/Runner/config/dev/GoogleService-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
    ;;
  "Debug-prod"|"Release-prod" )
    cp -r "${PROJECT_DIR}/Runner/config/prod/GoogleService-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"
    ;;
  *)
;;
esac