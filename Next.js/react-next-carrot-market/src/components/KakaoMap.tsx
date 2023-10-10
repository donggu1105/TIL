'use client';
import { Map, MapMarker } from "react-kakao-maps-sdk"
import React, { FC } from 'react'
interface KakaoMapProps {
    latitude: number,
    longitude: number,
    setCustomValue?: (id: string, value: number) => void,
    detailPage?: boolean,
}

const KakaoMap: FC<KakaoMapProps> = ({ latitude, longitude, setCustomValue, detailPage = false }) => {
    const handleClick = (mouseEvent: kakao.maps.event.MouseEvent) => {
        if (detailPage) return;
        setCustomValue!('latitude', mouseEvent.latLng.getLat());
        setCustomValue!('longitude', mouseEvent.latLng.getLng());
    }

    return (
        <Map
            center={{ lat: latitude, lng: longitude }}
            style={{ width: "100%", height: "360px" }}
            onClick={(_t, mouseEvent) => handleClick(mouseEvent)}
        >
            <MapMarker position={{ lat: latitude, lng: longitude }} />
        </Map>
    )
}

export default KakaoMap



