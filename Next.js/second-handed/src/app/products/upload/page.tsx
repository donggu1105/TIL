'use client';
import Container from '@/components/Container';
import Input from '@/components/Input'
import {useState} from "react";
import {FieldValues, SubmitHandler, useForm} from "react-hook-form";
import {Button} from "@/components/Button";
import Heading from '@/components/Heading';
import ImageUpload from "@/components/ImageUpload";
import {categories} from "@/components/categories/Categories";
import CategoryInput from "@/components/categories/CategoryInput";
import KakaoMap from "@/components/KakaoMap";
import dynamic from "next/dynamic";
import axios from "axios";
import {useRouter} from "next/navigation";

const ProductUploadPage = () => {

    const [isLoading, setIsLoading] = useState(false);
    const {
        register,
        handleSubmit,
        setValue,
        watch,
        formState: {
            errors
        },
        reset
    } = useForm<FieldValues>({
            defaultValues: {
                title: '',
                description: '',
                category: '',
                latitude: 33.5563,
                longitude: 126.79581,
                imageSrc: '',
                price: 1,
            }
        }
    )

    const KakaoMap = dynamic(() => import('../../../components/KakaoMap'),{
        ssr: false
    })

    const imageSrc = watch('imageSrc')
    const category = watch('category')
    const latitude = watch('latitude')
    const longitude = watch('longitude')
    const router = useRouter();

    const onSubmit: SubmitHandler<FieldValues> = (data) => {
        setIsLoading(true);

        axios.post('/api/products', data)
            .then((response) => {
                router.push(`/products/${response.data.id}`);
                reset();
            })
            .catch((err) => {
                console.error(err);
            })
            .finally(() => {
                setIsLoading(false);
            })

    }

    const setCustomValue = (id: string, value: any) => {
        setValue(id, value);
    }


    return (
        <Container>
        <div className='
            max-w-screen-lg mx-auto
        '>
            <form className='flex flex-col gap-8' onSubmit={handleSubmit(onSubmit)}>

                <Heading title="Product Upload" subtitle="upload your product"/>

                <ImageUpload value={imageSrc} onChange={(value) => setCustomValue('imageSrc', value)}></ImageUpload>

            <Input
                id="title"
                label="Title"
                disabled={isLoading}
                register={register}
                errors={errors}
                required
            />

            <hr />

            <Input
                id="description"
                label="Description"
                disabled={isLoading}
                register={register}
                errors={errors}
                required
            />

            <hr />

            <Input
                id="price"
                label="Price"
                formatPrice
                disabled={isLoading}
                register={register}
                errors={errors}
                required
            />

            <hr />


            <div
                className='
                grid
                grid-cols-1
                md:grid-cols-2
                gap-3
                max-h-[50vh]
                overflow-auto
                '
            >

                {categories.map((item) => (
                    <div key={item.label} className='col-span-1'>
                        <CategoryInput onClick={(category) => setCustomValue('category', category)}
                                       selected={category === item.path}
                                       label={item.label}
                                       icon={item.icon}
                                       path={item.path}
                        />

                    </div>
                ))}

            </div>

            <hr/>

            <KakaoMap setCustomValue={setCustomValue} latitude={latitude} longitude={longitude}/>

                <Button label="상품 생성하기"></Button>

            </form>

        </div>

        </Container>
    );
};

export default ProductUploadPage;