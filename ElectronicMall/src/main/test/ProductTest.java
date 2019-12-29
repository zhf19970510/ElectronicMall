import com.zhf.entity.Product;

/**
 * Created on 2019/12/26 0026.
 */
public class ProductTest {
    public static void main(String[] args) {
        Product product = new Product();
        product.setId(738);
        product.setName("润肤露");
        product.setDescription("润肤露，是乳液的一种，能深入滋润干燥肌肤，补充肌肤每天流失的水份。天然保湿因子，由内部强化其天然保湿层，特效的含油配方，给您多一点的滋润。");
        product.setPrice(45F);
        Product product1 = new Product();
        product1.setId(738);
        product1.setName("润肤露");
        product1.setDescription("润肤露，是乳液的一种，能深入滋润干燥肌肤，补充肌肤每天流失的水份。天然保湿因子，由内部强化其天然保湿层，特效的含油配方，给您多一点的滋润。");
        System.out.println(product.equals(product1));

    }
}