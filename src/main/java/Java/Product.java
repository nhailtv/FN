package Java;

public class Product {
	private String name;
	private String category;
	private double price;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double d) {
		this.price = d;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Product(String name, String category, double price, String image) {
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
