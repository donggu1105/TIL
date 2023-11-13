environment="default"
 
 if [[ $CONFIGURATION =~ -([^-]*)$ ]]; then
 environment=${BASH_REMATCH[1]}
 fi
 
 # Name and path of the resource we're copying
 FIREBASEPPID_INFO_PLIST=firebase_app_id_file.json
 FIREBASEPPID_INFO_FILE=${PROJECT_DIR}/Runner/config/${environment}/${FIREBASEPPID_INFO_PLIST}
 
 if [ ! -f $FIREBASEPPID_INFO_FILE ]
 then
 echo "No firebase_app_id_file.json found. Please ensure it's in the proper directory."
 exit 1
 fi
 
 PLIST_DESTINATION=${PROJECT_DIR}
 cp "${FIREBASEPPID_INFO_FILE}" "${PLIST_DESTINATION}"