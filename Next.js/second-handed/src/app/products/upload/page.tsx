'use client';
import Input from '@/components/Input'
import {useState} from "react";
import {FieldValues, useForm} from "react-hook-form";

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


    return (
        <div>
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

            <

        </div>
    );
};

export default ProductUploadPage;