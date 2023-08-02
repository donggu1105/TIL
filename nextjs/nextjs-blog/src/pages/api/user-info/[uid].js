/***
 * export: 이 키워드는 현재 파일의 특정 값이나 함수를 다른 파일에서 가져올 수 있도록 내보냅니다.
 *
 * default: 여러 개의 값을 내보낼 수 있지만, default 키워드는 해당 파일에서 기본적으로 가져올 값이나 함수를 지정합니다. 한 파일에는 하나의 기본 내보내기만 있을 수 있습니다.
 *
 * function: 이 키워드로 함수를 정의합니다.
 *
 */

export default function handler(req, res) {

    /**
     * const {uid} = req.query; 코드에서 중괄호 {}는 구조 분해 할당을 사용하고 있으며, req.query 객체에서 uid라는 속성을 변수로 추출하고 있습니다.
     *
     * 이 코드는 다음과 동일한 작업을 수행합니다:
     *
     * 이렇게 하면 req.query 객체 내부에 있는 uid 속성에 직접 접근하여 그 값을 상수로 저장할 수 있습니다. 코드를 좀 더 간결하고 가독성 있게 만드는 데 도움이 됩니다.
     *
     */
    const {uid} = req.query;
    const cookies = req.cookies;

    res.status(200).json({name: `donggu ${uid} ${JSON.stringify(cookies)}`})

};