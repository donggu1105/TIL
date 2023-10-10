const uploadImage = async (image: File) => {
  const url = "https://api.cloudinary.com/v1_1/jaewon/upload";
  const formData = new FormData();
  formData.append("file", image);
  formData.append("upload_preset", process.env.NEXT_PUBLIC_CLOUDINARY_UPLOAD_PRESET!);

  const response = await fetch(url, {
    method: "POST",
    body: formData,
  });
  const data = await response.json();
  console.log(data);
  return data.url;
};

export default uploadImage;


