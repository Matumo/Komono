import java.io.PrintStream;

public class PrintSuperClass {

	public static void main(String[] args) {
		Class<?> c = PrintStream.class; // 調べたいクラス
		printSuperClass(c);
	}

	private static void printSuperClass(Class<?> c) {
		printSuperClass(c, 0, "");
	}

	private static void printSuperClass(Class<?> c, int num, String label) {
		String topLabel = "";
		for(int i = 0; i < num; i++) {
			topLabel += " ";
		}

		System.out.println(topLabel + num + label + " : " + c.getName());

		Class<?>[] is = c.getInterfaces();
		int inum = 1;
		for(Class<?> i : is) {
			printSuperClass(i, num, label + "-" + inum);
			inum++;
		}

		c = c.getSuperclass();
		num++;
		if(c != null) printSuperClass(c, num, label);
	}

}