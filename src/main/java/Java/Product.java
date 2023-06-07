package Java;

public class Product {
	private String name;
	private String category;
	private String price;
	private String image;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Product(String name, String category, String price, String image) {
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
	}

	public Product() {
	}
	@Override
	public String toString() {
		return "Product [name=" + name + ", category=" + category + ", price=" + price + ", image=" + image + "]";
	}
	

}
