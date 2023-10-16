'use client';
import Container from '@/components/Container';
import Input from '@/components/Input'
import {useState} from "react";
import {FieldValues, SubmitHandler, useForm} from "react-hook-form";
import {Button} from "@/components/Button";
import Heading from '@/components/Heading';
import ImageUpload from "@/components/ImageUpload";

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

    const imageSrc = watch('imageSrc')

    const onSubmit: SubmitHandler<FieldValues> = (data) => {


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
            {/* Category */}
            </div>

            <hr/>

        {/*    kakao map */}

                <Button label="상품 생성하기"></Button>

            </form>

        </div>

        </Container>
    );
};

export default ProductUploadPage;