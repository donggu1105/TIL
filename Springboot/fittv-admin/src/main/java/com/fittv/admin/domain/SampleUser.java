package com.fittv.admin.domain;

import com.fittv.admin.enums.Gender;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 샘플 유저 테이블
 */
@Getter
@NoArgsConstructor
@SuperBuilder
@DynamicUpdate
@Entity
@Table(name = "sample_user")
public class SampleUser extends BaseEntity {

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "phone_number", nullable = false, length = 11)
    private String phoneNumber;

    @Builder.Default
    @Enumerated(EnumType.ORDINAL)
    @Column(name = "gender", nullable = false)
    private Gender gender = Gender.MALE;



}
